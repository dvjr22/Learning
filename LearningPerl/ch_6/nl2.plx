#!/usr/bin/perl
#nl2.plx
use warnings;
use strict;

#line counter
my $lineno = 1;

#while there is a file to be read - fed in from cmd line
while(<>){
	#print and then increment line count 
	print $lineno++;
	#print line
	print ": $_";
}
