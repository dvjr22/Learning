#!/usr/bin/perl
#sortfinal.plx
use warnings;
use strict;

# $numeric to check if doing numeric sort
my $numeric = 0;
# $input file to be taken as input
my $input = shift;
# if input was given and set to -n
if(defined $input and $input eq "-n"){
	# $numeric set to 1 = true
	$numeric = 1;
	# shift for actual input file name
	$input = shift;
}
# $output file name
my $output = shift;

# if input is defined
if(defined $input){
	# open the specified file
	open INPUT, $input or die "Couldn't open file $input: $!\n";
} else {
	# input is what is defined in cmd line 
	*INPUT = *STDIN;
}

# if output is defined
if(defined $output){
	# create new file 
	open OUTPUT, ">$output" or die "Couldn't open file $input: $!\n";
} else {
	# output to cmd line
	*OUTPUT = *STDOUT;
}

# array to store input
my @file = <INPUT>;
# check if sorting alpha/numeric
if($numeric){
	# sort numerically
	@file = sort { $a <=> $b } @file;
} else {
	# sort alpha
	@file = sort @file;
}

# print to specified output
print OUTPUT @file;
