#!/user/bin/perl
#number1.plx
use warnings;

print 25," ", -4, "\n";
print 25_000_000, " ", -4, "\n";
print 25_000_000, " ", 3.14159265389793238462643383279, "\n";

print "\n";
# types of numbers in different forms
print 255, "\n";
# 0 for octal
print 0377, "\n";
# 0b for binary
print 0b11111111, "\n";
# 0x for hex
print 0xFF, "\n";

# numbers as strings
print "\n";
print "0x30\n";
print "030\n";
print hex("0x30"), "\n";
print oct("030"), "\n";

print "\n";
print hex("FF"), "\n";
print oct("377"), "\n";
print oct("17"), "\n";
# convert binary string to number
print oct("0b11010"), "\n";
