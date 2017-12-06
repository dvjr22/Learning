#!/usr/bin/perl
#logfile.plx
use warnings;
use strict;

#change this to "file" to send the log to a file!
#change this to "screen to send the log to the screen!
#my $logging = "screen";  
my $logging = "file";

#check $logging
if($logging eq "file"){
	#open log file to place output
	open LOG, "> output.log" or die $!;
	#select the LOG as destination of output
	select LOG;
}

#print localtime returns local timezone in a list
#scalar localtime returns in readable format
print "program started: ", scalar localtime, "\n";
#sleep for 30 sec
sleep 30;
print "Program finished: ", scalar localtime, "\n";

#select the STDOUT(screen) for the output
select STDOUT;


