<?xml version="1.0"?>

<queryset>
<rdbms><type>oracle</type><version>8.1.6</version></rdbms>

    <fullquery name="select_folder_contents">
        <querytext>
            select
              o.object_id,
              nvl(f.label, fs_tree.name) as name,
              fs_tree.live_revision as version_id,
              fs_tree.content_type,
              r.content_length,
              fs_tree.parent_id as folder_id,
              content_item.get_path(o.object_id) as item_path,
              lpad(' ',(the_level - 1), ' ') as spaces,
              rels.related_object_id as homework_file_id,
              c.first_names || ' ' || c.last_name as file_owner_name,
              o.creation_user
            from cr_item_rels rels, acs_objects o, cr_revisions r, cr_folders f, cc_users c,
              (select cr_items.*, level as the_level
               from cr_items
               where level >= :min_level and level <= :max_level
               start with item_id in ([join $list_of_folder_ids ", "])
               connect by parent_id = prior item_id) fs_tree
            where o.object_id = fs_tree.item_id
              and c.user_id(+) = o.creation_user
              and f.folder_id(+) = fs_tree.item_id
              $qualify_by_owner
              and r.item_id(+) = fs_tree.item_id
              and r.content_length(+) = fs_tree.item_id
              and rels.item_id(+) = o.object_id
              and rels.relation_tag(+) = 'homework_correction'
              and not exists (select 1
                              from cr_item_rels
                              where related_object_id = o.object_id
                                and relation_tag = 'homework_correction')
            order by item_path
        </querytext>
    </fullquery>

</queryset>
