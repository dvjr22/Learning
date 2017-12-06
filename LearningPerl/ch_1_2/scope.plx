#!/usr/bin/perl
#scope.plx
use warnings;
use strict;

our $record = 4;
our $test = 10;
print "We're at record ", $record, "\n";
print "Test is: ", $test, "\n";
print "\n";

{
	my $record;
	$record = 7;
	print "Inside the block, we're at record ", $record, "\n";
	my $test = 20;
	print "Inside the block, test: ", $test, "\n";
	print "\n";
}

print "We're still at record ", $record, "\n";
print "Test is: " , $test, "\n";
