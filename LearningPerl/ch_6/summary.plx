#!/usr/bin/perl
#summary.plx
use warnings;
use strict;

#delimeter set for new paragraph
$/ = "";
my $counter = 1;

while(<>){
	print $counter++, ":";
	#split lines of paragraph
	print ((split /\n/, $_) [0]);
	print "\n";
}
