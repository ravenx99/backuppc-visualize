// the default backuppc-visualize ploticus script

#proc page
  pagesize: 15 10
  dopagebox: yes
  scale: 1

// the data actually has more columns, but we're ignoring the
// fields we don't need.

// hostname,backup#,incr/full,begin,end

#proc getdata
  delim: comma
  // -d <days to view> -p <hostdir path> -e <exclude regex>
  command: ./bpcviz-gatherdata -d 3 -p ./pc -e '.+-old barky apache2'

// the legendentrys match a color (details) to
// the field value (incr/full) in the data file,
// which gets used to color the bars in the plot
#proc legendentry
  sampletype: color
  label: full
  details: red
  tag: full

#proc legendentry
  sampletype: color
  label: incr
  details: orange
  tag: incr

#proc categories
axis: y
datafield: 1

#proc areadef
  title: BackupPC Timeline
  rectangle: 1.5 0.5 14.5 9.5
  xscaletype: datetime mm-dd-yyyy.hh:mm
  xautorange: datafield=4,5 nearest=hour
  yscaletype: categories

#proc yaxis
  stubs: categories
  grid: color=powderblue

#proc xaxis
  stubs: inc 3 hours
  stubformat: hh:mm
  minortics: yes
  minorticinc: 1 hour
  // places days on scale only where they start
  autodays: mm-dd
  grid: color=orange style=2

#proc bars
  axis: x
  locfield: 1
  segmentfields: 4 5
  barwidth: 0.05
  colorfield: 3
