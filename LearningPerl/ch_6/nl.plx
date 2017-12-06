#!/usr/bin/perl
#nl.plx
use warnings;
use strict;

#open file, if file can't be found, die w/ error msg
#FILE is treated like a variable
open FILE, "nlexample.txt" or die $!;

#initilize line counter at 1
my $lineno = 1;

#read each line in the file 
while(<FILE>){
	#print the line number and increment counter
	print $lineno++;
	#print the line
	print ": $_";
}

#ch6pg5
