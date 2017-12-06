#!/usr/bin/perl
#copy.plx
use warnings;
use strict;

#use @ARGV to shift through cmd line input to get
#source file and destination file names
my $source = shift @ARGV;
my $destination = shift @ARGV;

#open the source file if it exits
open IN, $source or die "Can't read source file $source: $!\n";
#create an out file if possible
open OUT, ">$destination" or die "Can't write on file $destination: $!\n";

print "Copying $source to $destination\n";

#while in has lines
#print OUT <IN>; would work like this while loop for smaller files
#while loop is better for every type of file
while(<IN>) {
	#print the contents to the out file
	print OUT $_;
}
