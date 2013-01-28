backuppc-visualize
==================

**BackupPC-Visualize** - a backup duration visualization tool


DESCRIPTION
-----------

  Plots a visual timeline of recent BackupPC host backup durations,
  allowing a better understanding of which backups are running long or
  otherwise causing trouble.

  + Full and incremental backups are shown in different colors.
  + An exclude list filters hosts from the output.
  + Number of days to plot is adjustable.


DEPENDENCIES
------------

  Requires the Ploticus graphical plotting package.
  See <http://ploticus.sourceforge.net/>


USAGE
-----

BackupPC-Visualize (bpcviz) consists of two parts.  A Perl script that
gathers backup data from **/var/lib/backuppc/pc/<host>/backups**, munges
and sorts the data, and a Ploticus script that renders the data in a
useful display.

The intention is to generate graphs that can be viewed online
(launched from a cronjob or a simple web form), but bpcviz works
equally well from the command-line directly on the BackupPC server or
on a copy of the "backups" files on your own workstation.

bpcviz-gatherdata takes three parameters:

* -d <days> : the number of days to view, always anchored on "today"
* -p <path> : path to backup data; defaults to
   **/var/lib/backuppc/pc**
* -e '<exclude list>' : a space-separated list of Perl regular
   expressions to filter from the host names

**bpcviz.plot** is the default Ploticus script.  Feel free to use this
as a starting point to customize your own plot output.
**bpcviz-gatherdata** is called directly from the Ploticus script, so any
adjustment to its parameters is done here.

**doit** is a simple example script that runs the Ploticus script and
displays the graph (using ImageMagick or GraphicsMagick's display
command).  If you are on Debian Linux, the Ploticus package doesn't
name the Ploticus binary as "pl" as Ploticus expects.  I create a
symlink of **/usr/local/bin/pl**.


AUTHOR
------

  Carl D Cravens <raven@phoenyx.net>


LICENSE & COPYRIGHT
-------------------

**Copyright 2013 Carl D Cravens**

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

------------------------------------------------------------------------

VERSION: 0.0.1a

Source repo: <https://github.com/ravenx99/backuppc-visualize/>

------------------------------------------------------------------------
