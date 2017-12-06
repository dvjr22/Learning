#!/usr/bin/perl
#tail.plx
use warnings;
use strict;

#####using an array to cycle through unknown number of lines#####

#open file gettysburg.txt or quit
open FILE, "gettysburg.txt" or die $!;
#array to store lines
my @last5;

#while there is a file
while(<FILE>){
	#Add to the end
	push @last5, $_;
	#Take from the beginning
	shift @last5 if @last5 > 5; 
}

#print array
print "Last five lines: \n", @last5;


#####using an array to cycle through known short file#####

#open file and set up array to store lines
open FILE, "gettsyburg.txt" or die $!;
my @speech = <FILE>;

#print last 5 indexes of array
print "Last five lines:\n", @speech[-5...-1];
