#!/usr/bin/perl
#fortune.plx
use warnings;
use strict;

#change file delimeter to be new line followed by %
$/ = "\n%\n";

#open file
open QUOTES, "quotes.dat" or die$!;
#assign each record of file to element in array
my @file = <QUOTES>;

#rand returns random # between 0 and number passed as arguement
my $random = rand(@file);
#set $fortune to the random element in array
my $fortune = $file[$random];
#my $fortune = $file[rand @file];

#chomp and print
chomp($fortune);
print $fortune, "\n";
