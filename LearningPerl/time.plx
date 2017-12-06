#!/usr/bin/perl
#time.plx
use warnings;
use strict;

#count to 20 w/ a 1 sec delay and then print each dot
for(1...20){
	print ".";
	sleep 1;
}
print "\n\n";

#set $| which determines output buffering
#0 means print at the end of every new line
#1 means print immediately
$| = 1;
for(1...20){
	print ".";
	sleep 1;
}
print "\n";
