#!/usr/bin/perl
# nl3.plx
use warnings;
use strict;

my $lineno;
#variable to contain current value of ARGV
my $current = "";

#while there is a file to be read
while(<>) {
	#check if $current and $ARGV are the same
	#if they aren't equal, new file and print out
	if ($current ne $ARGV){
		#set $current to $ARGV
		$current = $ARGV;
		#print name of new file
		print "\n\t\tFile: $ARGV\n\n";
		#set line of new file to one
		$lineno = 1;
	}
	#print line and increment
	print $lineno++;
	#print line
	print ": $_";

}
