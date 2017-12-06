#!/usr/bin/perl
#bitop1.plx
use warnings;

# and operator
print "204 ANDed with 170 gives us ", 204 & 170, "\n";
print "51 ANDed with 85 gives us ", 51 & 85, "\n";
print "51 ANDed with 170 gives us ", 51 & 170, "\n";
print "\n";

# or operator
print "204 ORed with 170 gives us ", 204 | 170, "\n";
print "51 ORed with 85 gives us ", 51 | 85, "\n";
print "51 ORed with 170 gives us ", 51 | 170, "\n";
print "\n";

# exclusive or operator
print "204 EXORed with 170 gives us ", 204 ^ 170, "\n";
print "51 EXORed with 85 gives us ", 51 ^ 85, "\n";
print "51 EXORed with 170 gives us ", 51 ^ 170, "\n";
print "\n";

# not operator
# will be different depending on 32 bit and 64 bit
print "NOT 85 is ", ~85, "\n";
