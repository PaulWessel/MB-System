.TH mbunclean l "13 July 2001" "MB-System 5.0" "MB-System 5.0"
.SH NAME
\fBmbunclean\fP - Unflags edited beams in swath sonar bathymetry data.

.SH VERSION
Version 5.0

.SH SYNOPSIS
\fBmbunclean\fP [\fB-B\fIlow/high \fB-F\fIformat \fB-L\fIlonflip\fP 
\fB-I\fIinfile \fB-O\fIoutfile \fB-N \fB-V -H\fP]

.SH DESCRIPTION
\fBmbunclean\fP  is a utility for reversing previous attempts to edit
swath sonar bathymetry data.  Bad data is conventionally flagged by
setting depth values negative; \fBmbunclean\fP sets negative depths
positive. All flagged depths will be unflagged unless depth range checking 
is specified and the depth value in
question is outside the acceptable range.  The default 
input and output streams are stdin and stdout.

.SH AUTHORSHIP
David W. Caress (caress@mbari.org)
.br
  Monterey Bay Aquarium Research Institute
.br
Dale N. Chayes (dale@ldeo.columbia.edu)
.br
  Lamont-Doherty Earth Observatory

.SH OPTIONS
.TP
.B \-B
\fIlow/high\fP
.br
This option sets the range of acceptable depth values.  If a depth
value is less than \fIlow\fP or more than \fIhigh\fP then it
will not be unflagged. No depth range checking is done if the \fB-B\fP option
is not used.
.TP
.B \-F
\fIformat\fP
.br
Sets the format for the input and output swath sonar data using 
\fBMBIO\fP integer format identifiers. 
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
Data file from which the input data will be read. If
no input file is specified, the input will be read
from stdin. Default: \fIinfile\fP = stdin.
.TP
.B \-L
\fIlonflip\fP
.br
Sets the range of the longitude values used.
If \fIlonflip\fP=-1 then the longitude values will be in
the range from -360 to 0 degrees. If \fIlonflip\fP=0 
then the longitude values will be in
the range from -180 to 180 degrees. If \fIlonflip\fP=1 
then the longitude values will be in
the range from 0 to 360 degrees.
Default: \fIlonflip\fP = 0.
.TP
.B \-O
\fIoutfile\fP
.br
Data file to which the output data will be written. If
no output file is specified, the output will be written to
stdout. Default: \fIoutfile\fP = stdout.
.TP
.B \-V
Normally, \fBmbunclean\fP works "silently" without outputting
anything to the stderr stream.  If the
\fB-V\fP flag is given, then \fBmbunclean\fP works in a "verbose" mode and
outputs the program version being used, all error status messages, 
and the number of unflagged beams.

.SH EXAMPLES
Suppose one wishes to unflag the bathymetry data in a previously edited
binary Hydrosweep file (format 24) called hs_e.mb24.  The following will
suffice:
 	mbunclean -F24 -Ihs_e.mb24 -Ohs_eu.mb24

.SH SEE ALSO
\fBmbsystem\fP(l), \fBmbclean\fP(l), \fBmbedit\fP(l)

.SH BUGS
You tell me.