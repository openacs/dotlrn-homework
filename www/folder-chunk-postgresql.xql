<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

    <fullquery name="select_folder_contents">
        <querytext>
            select
              o.object_id,
              coalesce(f.label, fs_tree.name) as name,
              fs_tree.live_revision as version_id,
              fs_tree.content_type,
              r.content_length,
              fs_tree.parent_id as folder_id,
              content_item__get_path(o.object_id, null) as item_path,
              lpad(' ',the_level, ' ') as spaces,
              rels.related_object_id as homework_file_id,
              c.first_names || ' ' || c.last_name as file_owner_name,
              o.creation_user,
              case when f.folder_id is null then 1 else 0 end as file_p
            from (select c1.*,
                  tree_level(c1.tree_sortkey) - tree_level(c2.tree_sortkey) as the_level
                  from cr_items c1, cr_items c2
                  where c2.item_id in ([join $list_of_folder_ids ", "])
                    and c1.tree_sortkey between c2.tree_sortkey and tree_right(c2.tree_sortkey)
                    and tree_level(c1.tree_sortkey) - tree_level(c2.tree_sortkey) + 1
                        between :min_level and :max_level) fs_tree
              join acs_objects o on (o.object_id = fs_tree.item_id)
              left join cr_folders f on (f.folder_id = fs_tree.item_id)
              left join cr_revisions r on (r.revision_id = fs_tree.live_revision)
              left join cr_item_rels rels on (rels.item_id = fs_tree.item_id
                                              and rels.relation_tag = 'homework_correction')
              left join cc_users c on (c.user_id = o.creation_user)
            where
              not exists (select 1
                          from cr_item_rels
                          where related_object_id = o.object_id
                            and relation_tag = 'homework_correction')
              $qualify_by_owner
            order by file_p, item_path
        </querytext>
    </fullquery>

</queryset>
