
<property name="context">{/doc/dotlrn-homework {dotLRN Homework}} {dotLRN Homework Package Design Document}</property>
<property name="doc(title)">dotLRN Homework Package Design Document</property>
<master>
<h2>dotLRN Homework Package Design Document</h2>

by <a href="mailto:dhogaza\@pacifier.com">Don Baccus</a>
<hr>
<h3>Introduction</h3>

The dotLRN Homework package provides a dropbox for students to
upload homework files and for professors, teaching assistants and
other graders to upload their comments and corrections to such
files. The user interface is very similar to that provided by the
standard file storage package, with the result that users already
familiar with that package will find the Homework package very easy
to learn. The Homework package is designed to be mounted under each
dotLRN class instance, and creates a separate root folder for each
class.
<p>Administrators can make subfolders in class homework dropbox
folders. Typically this will be used to create a separate subfolder
for each homework assignment.</p>
<p>Administrators can ask to be notified by e-mail when a student
uploads a new homework file. Likewise, students are notified when a
comment or correction file is uploaded by a grader.</p>
<p>Students can only access homework files they've uploaded
themselves along with each file's associated comments and
corrections files.</p>
<p>Two applets and their associated portlets are provided:</p>
<dl>
<dt>User applet</dt><dd>
<p>When added to a class home portal page students will see a list
of folders and links to homework files they've uploaded for the
class. In addition a link is provided that allows students to
upload a new homework file.</p><p>Administrators (professors, etc) see a collapsed view which
displays a single link to the homework folder display page for the
class. We choose to do this because administrators are able to see
homework files uploaded by every student in the class. The
resulting list of folders and files in a large class with a number
of homework assignments will be too long to display on a crowded
portal page.</p>
</dd><dt>Admin applet</dt><dd><p>The admin applet allows administrators to enable or disable
e-mail alerts sent when a student uploads a new homework file.</p></dd>
</dl>
<p>In addition several display pages are provided to view or
download file revisions, to view or download comment files
associated with a particular homework file, to delete files, move
them from one subfolder to another, and so forth. The actions that
are available depend on whether the user is a student or
administrator.</p>
<h3>Implementation</h3>

The implementation is based on the standard OpenACS 4 File Storage
package. The requirements and design documents for the File Storage
package apply directly to the dotLRN Homework package.
<p>The dotLRN Homework package differs from File Storage mostly in
the actions that are made available to various classes of users and
by the fact that the content repository's item-to-object mapping
functionality is used to map a set of zero or more
comment/correction files to each homework file. Actions are
restricted by use of the acs permissions system. The user interface
has been modified slightly to simplify the uploading of
comment/correction files by graders.</p>
<p>ad_form is used to build forms in the dotLRN Homework package.
This means that the look and feel of all the forms generated by the
package can be changed by creating a single new form template
file.</p>
