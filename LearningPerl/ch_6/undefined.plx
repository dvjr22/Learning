#!/usr/bin/perl
#undefined.plx
use warnings;
use strict;

#set delimeter to nothing
#will make entire text the string
$/ = undef;

open QUOTES, "quotes.dat" or die $!;
my $file = <QUOTES>;

print "$file \n";
