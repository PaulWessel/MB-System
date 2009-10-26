.TH mbnaveditold l "18 January 2001" "MB-System 5.0" "MB-System 5.0"
.SH NAME
\fBmbnaveditold\fP - Old interactive navigation editor for swath sonar data.

.SH VERSION
Version 5.0

.SH SYNOPSIS
\fBmbnaveditold\fP [\fB-B\fIyr/mo/da/hr/mn/sc\fP 
\fB-D\fP \fB-E\fIyr/mo/da/hr/mn/sc\fP 
\fB-F\fIformat \fB-I\fIinfile \fB-P -V -H\fP]

.SH DESCRIPTION
\fBMBnavedit\fP is an interactive editor used to identify and fix 
problems with the navigation of swath sonar data.  The current
version of \fBmbnavedit\fP works in conjunction with
the \fBmbprocess\fP utility and uses a different i/o scheme.
This version has been retained for compatibility with 
previous releases of \fBMB-System\fP, but may be dropped
from future releases.

Once a file has been
read in, \fBmbnavedit\fP displays autoscaled plots of the longitude,
latitude, speed, and heading time series, along with a plot of
the time interval between navigation values. 
The user may select
outliers and interpolate over them or, in the case of heading or
speed data, replace the erroneous values with estimates derived 
from "course-made-good" or "speed-made-good", respectively.
Data can only be selected and altered in a single 
plot at a time (this avoids
confusion and prevents mistakes).

The nature of the navigation data being edited depends upon the
data format. Some data formats include the navigation in the
same data records as the ping or survey data. This synchronous
navigation implies that either in the sonar or in later processing,
the raw navigation has been interpolated to yield values at the
same time stamps as the sonar pings. Other data formats do not
hold navigation values in the survey data records, and instead use
separate navigation records with different time stamps. This
asynchronous navigation requires that MBIO interpolate or 
extrapolate the navigation as the survey data records are read.
For data formats with synchronous navigation, the navigation
values edited using \fBmbnavedit\fP are those in the survey data
records. For data formats with only asynchronous navigation, 
\fBmbnavedit\fP displays and operates on the values from the
navigation records. The \fBMBIO\fP manual page includes a listing
of which type of navigation is used by the supported data formats.

The time interval plot allows
users to spot problems with time stamps and to change the
time stamps, if necessary. If the navigation is 
asynchronous, that generally means the time interval should be
constant since navigation systems are set to output values at
a uniform rate. A problem with the time stamps of asynchronous
navigation should produce spikes in both the time interval plot
and the speed-made-good plot, and can be solved by selecting
the offending point in the time interval plot and interpolating
to reset the time stamp.

If the navigation is synchronous with the sonar
pings, then the time interval will vary because the ping
rate for many sonars varies with the sonars altitude above the
seafloor. In this case, time stamp problems will 
not produce spikes in the speed-made-good plot 
because the navigation has been interpolated
using the existing time stamps. Time interval spikes may also
reflect problems with the sonar (e.g. occasional failure to ping
at the appropriate time) rather than erroneous time stamps. 
However, one can reasonably infer a time stamp problem when
two or more pings have the same time stamp, and the facility
to select and interpolate the time interval values can be 
used to fix this problem.

For some data formats, the user can also 
inspect plots of roll, pitch, and heaved
data to determine if the ship's vertical reference sensors
were working properly.

In some cases, it may be useful to inspect or even use 
navigation derived from "dead reckoning" (DR). The DR
navigation is calculated from the initial position using the
heading and speed data. Separate longitude and latitude 
drift rates may be applied to force the DR navigation to
follow known positions. The primary use so far of this function
has been to rationalize noisy ultra-short-baseline (USBL)
navigation of towed vehicles. 

One special case which has been encountered is a problem with
the time stamps of survey records in data using a format with
asynchronous navigation. In order to use \fBmbnavedit\fP to
fix the time stamps of the survey data, one may invoke 
the \fB-P\fP option at the command line. This forces 
\fBmbnavedit\fP to work with interpolated synchronous navigation
rather than the asynchronous navigation records.
In this case, any changes made to the navigation values  will be
lost, but changes made to the time stamps will be applied to
the survey data records.

The edited data is usually output to a file, but the program
can be operated in a "browse" mode where no data is output.

.SH AUTHORSHIP
David W. Caress (caress@mbari.org)
.br
  Monterey Bay Aquarium Research Institute
.br
Dale N. Chayes (dale@ldeo.columbia.edu)
.br
  Lamont-Doherty Earth Observatory

.SH OPTIONS
.B \-B
\fIyr/mo/da/hr/mn/sc\fP
.br
Sets the starting time for data allowed in the input data; pings
with times before the starting time will be ignored. 
Default: \fIyr/mo/da/hr/mn/sc\fP = 1962/2/21/10/30/0.
.TP
.B \-D
Starts up the program in "browse" mode. If a file is opened
in browse mode (either at startup or later), none
of the edited data will be output to a file. The default
is to output the edited data to a file.
.TP
.B \-E
\fIyr/mo/da/hr/mn/sc\fP
.br
Sets the ending time for data allowed in the input data; pings
with times after the ending time will be ignored. 
Default: \fIyr/mo/da/hr/mn/sc\fP = 2062/2/21/10/30/0.
.TP
.B \-F
\fIformat\fP
.br
Sets the format at startup for the input and output swath sonar data using 
\fBMBIO\fP integer format identifiers. This value can also be set
interactively when specifying the input file.
This program uses the \fBMBIO\fP library and will read or write any swath sonar
format supported by \fBMBIO\fP. A list of the swath sonar data formats
currently supported by \fBMBIO\fP and their identifier values
is given in the \fBMBIO\fP manual page.
Default: \fIformat\fP = 11.
.TP
.B \-H
This "help" flag cause the program to print out a description
of its operation and then exit immediately.
.TP
.B \-I
\fIinfile\fP
.br
Sets the data file from which the input data will be read at startup.
This value can also be set interactively.  If the input file is named
using the \fBMB-System\fP convention of an ".mbXX" suffix (the XX
corresponds to the \fBMBIO\fP format id), then the output file name
will have an "e.mbXX" suffix. Otherwise, the output file will
be \fIinfile\fP with ".ed" appended.
.TP
.B \-O
\fIoutfile\fP
.br
Sets the output data file, overriding the file naming conventions
discussed above in the \fB-I\fP option.
.TP
.B \-P
Causes \fBmbnavedit\fP to load and work with navigation from 
survey data records even if the data format uses asynchronous
navigation records. In this case, the only edits which will
actually be applied to the output data are changes to the
time stamps of the survey records.
.TP
.B \-V
Normally, \fBmbnavedit\fP outputs information to the stderr stream
regarding the number of records loaded and dumped.  If the
\fB-V\fP flag is given, then \fBmbnavedit\fP works in a "verbose" mode and
outputs the program version being used, all error status messages, 
and a large amount of other information including all of the
beams flagged or zeroed.

.SH INTERACTIVE CONTROLS
.TP
.B File
This menu brings up a popup window which allows the user to
specify the input swath sonar data file, its \fBMBIO\fP
format id, the output mode, and the output filename. 
This program uses the \fBMBIO\fP library and 
will read or write any swath sonar 
format supported by \fBMBIO\fP. A list of the swath sonar data
formats currently supported by \fBMBIO\fP and their
identifier values is given in the \fBMBIO\fP manual page. 
If the swath sonar data file is named using the \fBMB-System\fP
suffix convention (format 11 files end with ".mb11", format
41 files end with ".mb41", etc.), then the program will
automatically use the appropriate format id and the default
output filename will have an "e.mbXX" suffix; otherwise the
format must be set by the user and the default output filename
will be \fIinfile\fP with ".ed" appended.
The popup window also allows the output mode to be set to "browse"
so that no data is output. 
When a valid file is specified and the \fBOK\fP button
is clicked, as much data as will fit
into the data buffer is read and the navigition times series
plots are displayed.
.TP
.B Next Buffer
This button causes the program to write out the data from the
current buffer and then read in and display the next buffer.
If there is no more data to be read in after the current buffer
has been written out, then the input and output files are closed.
.TP
.B Forward
This button causes the set of displayed pings to step \fInstep\fP 
pings forward in the current buffer.  The right mouse button causes
the same action.
.TP
.B Reverse
This button causes the set of displayed pings to step \fInstep\fP 
pings backward in the current buffer.  The middle mouse button causes
the same action.
.TP
.B Done
This button causes the program to write out all of the data from the
input file and then close the input and output files.
.TP
.B Quit
This button causes the program to exit gracefully.  If a data file
has been read, all of the data will be written to the output file
before exiting.
.TP
.B Pick
Clicking on this toggle button sets the edit mode to "pick". In
this case, clicking the left mouse button will cause the
nearest data value to toggle between selected (red) and
unselected. 
.TP
.B Select
Clicking on this toggle button sets the edit mode to "select". In
this case, clicking and dragging the left mouse button will 
cause any data value touched by the cursor to become selected. 
.TP
.B Deselect
Clicking on this toggle button sets the edit mode to "deselect". In
this case, clicking and dragging the left mouse button will 
cause any data value touched by the cursor to become unselected. 
.TP
.B Select All
Clicking on this toggle button sets the edit mode to "select all". In
this case, clicking in any of the editable plots will cause all
of the data in that plot to be selected. 
.TP
.B Deselect All
Clicking on this toggle button sets the edit mode to "select all". In
this case, clicking in any of the editable plots will cause all
of the data in that plot to be unselected. 
.TP
.B Time Span Shown
This slider sets the number of seconds shown at a time.
.TP
.B Time Step
This slider sets the number of seconds to step when the \fBForward\fP
or \fBReverse\fP buttons are pushed.
.TP
.B Interpolate Selection
This button causes the selected data to be replaced by linear interpolation
of the surrounding unselected data. If the selection extends to the
edge of the data, the selected data will be replaced by the first
unselected datum on the other side.
.TP
.B Revert Selection
This button causes the selected data to revert to their
original values.
.TP
.B Show Entire Buffer
This button causes the plots to expand to show all of the data
in the current buffer.
.TP
.B Pick Time Interval
This button allows users to focus the plots on a particular
time interval. Once the button is pushed, the left mouse button
is used to select the left edge of the time selection. Similarly,
the middle mouse button selects the right edge of the time selection.
Both ends of the time selection can be adjusted multiple times.
Once the time interval of interest is selected to the users
satisfaction, pressing the right mouse button will cause the
plots to be redrawn with the selected beginning and ending
times.
.TP
.B Time Interval Plot
This toggle button turns the time interval plot on and off.
.TP
.B Show Original Data (Time Interval Plot)
When this toggle button is on, the time interval plot includes a
green line representing the original time interval values.
.TP
.B Longitude Plot
This toggle button turns the longitude plot on and off.
.TP
.B Show Original Data (Longitude Plot)
When this toggle button is on, the longitude plot includes a
green line representing the original longitude values.
.TP
.B Show Dead Reckoning (Longitude Plot)
When this toggle button is on, the longitude plot includes a
blue line representing the dead reckoning (DR) navigation.
The DR is calculated starting with the initial position
using the current heading and speed values. Longitude and
Latitude drift rates set from the Controls menu are also
used in the calculation.
.TP
.B Latitude Plot
This toggle button turns the latitude plot on and off.
.TP
.B Show Original Data (Latitude Plot)
When this toggle button is on, the latitude plot includes a
green line representing the original latitude values.
.TP
.B Show Dead Reckoning (Latitude Plot)
When this toggle button is on, the latitude plot includes a
blue line representing the dead reckoning (DR) navigation.
The DR is calculated starting with the initial position
using the current heading and speed values. Longitude and
Latitude drift rates set from the Controls menu are also
used in the calculation.
.TP
.B Use Dead Reckoning (Longitude and Latitude Plots)
When this button is pushed, any selected data in either the
longitude or latitude plots will be replaced by the 
current estimates of dead reckoning navigation. Both longitude
and latitude values will be affected.
.TP
.B Speed Plot
This toggle button turns the speed plot on and off.
.TP
.B Show Original Data (Speed Plot)
When this toggle button is on, the speed plot includes a
green line representing the original speed values.
.TP
.B Show Speed-Made-Good (Speed Plot)
When this toggle button is on, the speed plot includes a
blue line representing the speed-made-good values derived
from the longitude and latitude time series.
.TP
.B Use Speed-Made-Good (Speed Plot)
When this button is pushed, any selected data in the speed
plot will be replaced by the current estimates of speed-made-good.
.TP
.B Heading Plot
This toggle button turns the heading plot on and off.
.TP
.B Show Original Data (Heading Plot)
When this toggle button is on, the speed plot includes a
green line representing the original speed values.
.TP
.B Show Course-Made-Good (Heading Plot)
When this toggle button is on, the heading plot includes a
blue line representing the course-made-good values derived
from the longitude and latitude time series.
.TP
.B Use Course-Made-Good (Heading Plot)
When this button is pushed, any selected data in the heading
plot will be replaced by the current estimates of course-made-good.
.TP
.B Roll, Pitch, and Heave Plots
This toggle button turns the roll, pitch, and heave plots on and off.
Unlike the other plots, the data in these plots is not editable.
These data are shown purely to allow users to determine if the
vertical reference sensors were working properly at the time the
data was collected (note: many swath data formats do not contain roll,
pitch, and heave data).

.SH MOUSE ACTIONS
.TP
.B Left Mouse Button
The left mouse button is used to pick data values.  Unselected data
values are shown as filled black squares and selected values 
as empty red squares.  The manner in which data are selected or
unselected is controlled by the edit mode, as set by the 
\fBPick\fP, \fBSelect\fP, \fBDeselect\fP, \fBSelect All\fP, and
\fBDeselect All\fP buttons.
.TP
.B Middle Mouse Button
The middle mouse button causes the set of displayed data to 
step backward in the current buffer by the amount of time
set on the \fBTime Step\fP slider.  
The control button \fBReverse\fP causes
the same action.
.TP
.B Right Mouse Button
The right mouse button causes the set of displayed data to 
step forward in the current buffer by the amount of time
set on the \fBTime Step\fP slider.  
The control button \fBForward\fP causes
the same action.

.SH SEE ALSO
\fBmbsystem\fP(l), \fBmbnavedit\fP(l), \fBmbio\fP(l), \fBmbmerge\fP(l), 
\fBmbeditold\fP(l), \fBmbinfo\fP(l)

.SH BUGS
This program doesn't handle the roll, pitch, and
heave data in a general way. The main
window for \fBmbnavedit\fP is too large for use on screens
smaller than 1024 X 768 pixels.