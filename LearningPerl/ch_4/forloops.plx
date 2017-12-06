#!/usr/bin/perl
#forloops.plx
use warnings;
use strict;

my @array = (1,3,5,7,9);
my $i;

# standard for loop
for $i (@array){
	print "This element: $i\n";
}

print "\n";

# for each loop
foreach $i (@array){
	print "This element: $i\n";	
}

print "\n";

#for each w/ declaration
foreach my $j (@array){
	print "This element: $j\n";
}

print "\n";

# give $i a value
$i = "Hello there";
#use $i as the iterator
foreach $i (@array){
	print "This element: $i\n";
}
#return to initial value outside loop
print "All done: $i\n\n";

#aliases and values
@array = (1..10);
foreach (@array){
	#increments each value in the array
	$_++;
}

print "Array is now: @array\n";
print "\n";

#modify from a read only array
foreach (1,2,3,7,8,9){
	#$_ gets the value at the position of the arrary
	print "default iterator $_\n";
	#assigns the value at position to $i
	my $i = $_;
	$i++;
	print "iterator $i\n";
	print "default iterator after ++ $_\n";
}

#statement modifiers
my $total = 0;
#@ARGV is an array that takes everything in the command line
$total += $_ for @ARGV;
print "The total is $total\n";
print "\n";
