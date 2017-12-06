#!/usr/bin/perl
#sort.plx
use warnings;
use strict;

#open files
#because no array specified, perl assumes @ARGV
#set numeric to dictate numeric sort
my $numeric = 0;
my $input = shift;
#if first input is "-n" program shifts to numeric sort
if($input eq "-n"){
	#numeric set to 1
	$numeric = 1;
	#2nd cmd line input is now input file
	$input = shift;
}
#shift to next cmd line for output file name
my $output = shift;

#open file if it exitst and create file if possible
open INPUT, $input or die "Couldn't open file $input: $!\n";
open OUTPUT, ">$output" or die "Couldn't open file $input: $!\n";

#place input into @file
my @file = <INPUT>;
#if numeric is true
if ($numeric) {
	#sort numerically
	@file = sort { $a <=> $b } @file;
} else {
	#sort alpha
	@file = sort @file;
}

#print contents to output
print OUTPUT @file;

