#!/usr/bin/perl
#inline.plx
use warnings;
use strict;

my $string = "There's more than One Way to do it!";

print "Enter a test expression:";
my $pat = <STDIN>;
chomp($pat);

if($string =~ /$pat/){
	print "Congratulations! '$pat' matches the sample string.\n";
} else {
	print "Sorry. No match found for '$pat'.\n";
}
