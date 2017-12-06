#!/usr/bin/perl
#array_functions.plx
use warnings;
use strict;

my @count = (1..5);
for (reverse(@count)){
	print "$_...\n";
	sleep 1;
}

print "Blast Off!\n\n";

#pop and push
#add remove from top
my $hand;
my @pileofpaper = ("letter", "newspaper", "gas bill", "notepad");

print "Here's what's on the desk: @pileofpaper\n";

print "You pick up something off the top of the pile.\n";
$hand = pop @pileofpaper;
print "You picked up a $hand.\n";

print "Left on the desk is: @pileofpaper\n";

print "You pick up the next thing, and throw it away.\n";
pop @pileofpaper;

print "You put the $hand back on the pile.\n";
push @pileofpaper, $hand;

print "You also put a leaflet and a bank statement on the pile.\n";
push @pileofpaper, "leaflet", "bank statement";

print "Left on the desk is: @pileofpaper\n";
print "\n";

#shift and unshift
#add remove from bottom
my @array = ();
unshift(@array, "first");
print "Array is now: @array\n";
unshift @array, "second", "third";
print "Array is now @array\n";
shift @array;
print "Array is now: @array\n";
print "\n";

#sort
#alpha
my @unsorted = qw(Cohen Clapton Costello Cream Cocteau);
print "Unsorted: @unsorted\n";
my @sorted = sort @unsorted;
print "Sorted: @sorted\n";
print "\n";

#numbers
#improperly
@unsorted = (1,2,11,24,3,36,40,4);
@sorted = sort @unsorted;
print "Sorted: @sorted\n";
print "\n";

#properly
#string sort
my @string = sort{ $a cmp $b } @unsorted;
print "String sort: @string\n";
#number sort
my @number = sort{ $a <=> $b } @unsorted;
print "Numeric sort: @number\n";
print "\n";

