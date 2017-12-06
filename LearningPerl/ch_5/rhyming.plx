#!/usr/bin/perl
#rhyming.plx
use warnings;
use strict;

#pattern to match
my $syllable = "ink";
#loop through file one line at a time
while (<>){
	#check the end of the string for "ink"
	print if /$syllable$/;
}
