ADVANCED USAGE
==============

Using the exclude list
----------------------

`bpcviz-gatherdata` takes an exclude list, which will filter
matching host names from the results.  Like so

    -e "foo bar baz"

And the three backup hosts known as "foo", "bar" and "baz" will not
show up in the resulting plot.

If you know a little Perl, more advanced usage is possible.  The
exclude list, a space-separated list of strings, is be interpreted
as a series of Perl regular-expression patterns.  The strings will be
interspersed with vertical bars and embedded in parenthesis to create
an alternation match, anchored at both ends.

    "foo bar baz"
    
is translated to

    ^(\.+|foo|bar|baz)$

So, one may use any valid Perl regex pattern, such as ".+-old", as an
exclude element.


Generating plots on a different machine
---------------------------------------

**BackupPC-Visualize** is meant to be used "in place" on your **BackupPC**
server to generate plots to be viewed from the web, via cron or
on-demand through CGI.

But there may be times you want to run **Ploticus** elsewhere, such as
on a workstation.  There are two easy ways to do this:

### If you just need a subset of the data

Run `bpcviz-gatherdata` by hand.  All this script does is gather,
filter and sort the data, outputting it as a flat file.  If you want
to filter and sort once, you can run `bpcviz-gatherdata` by hand,
redirecting to a file, then copy the file to the target machine.

Alter the `.plot` file, replacing the *command:* string with

    pathname: <filename>

then run **Ploticus** as usual.


### If you need all the raw data

If working locally, the author's preference is to copy the entire set
of raw data to work with, so the parameters can be adjusted on the
fly.  You can easily capture just the data files:

    cd /var/lib/backuppc
    tar cfz pc.tgz pc/*/backuppc

Then copy the tar file to the target machine and unpack it into a
working directory.  Adjust the *command:* string in the `.plot` file
to include the `-p ./pc` so `bpcviz-gatherdata` knows where to
find the data.
