#!/usr/bin/perl
#bool.plx
use warnings;

# boolean stuff
print "Is two equal to four? ", 2 == 4, "\n";
print "Ok, then, is six equal to six? ", 6 == 6, "\n";
print "\n";

print "So, two isn't equal to four? ", 2 != 4, "\n";
print "\n";

print "Five is more than six? ",	5 > 6, "\n";
print "Seven is less than sixteen? ", 	7 < 16, "\n";
print "Two is equal to two? ", 		2 == 2, "\n";
print "One is more than one? ",		1 > 1, "\n";
print "Six is not equal to seven? ", 	6 != 7, "\n";
print "\n";

print "Seven is less than or equal to sixteen? ", 7 <= 16, "\n";
print "Two is more than or equal to two? ", 2 >= 2, "\n";
print "\n";

# -1 if right side bigger
print "Compare six and nine? ", 6 <=> 9, "\n";
# 0 if equal
print "Compare seven and seven? ", 7 <=> 7, "\n";
# 1 if left side bigger
print "Compare eight and four? ", 8 <=> 4, "\n";
print "\n";

# more boolean stuff
print "6 > 3 && 12 > 4 : ", 6 > 3 && 12 > 4, "\n";
print "Test one: ", 6 > 3 && 3 > 4, "\n";
print "Test two: ", 6 > 3 and 3 > 4, "\n";
print "\n";

print 4 >= 2 and print " Four is more than or equal to two\n";
# doesn't work
#print 4 >= 2 print "Four is more than or equal to two\n";
print "\n";

print "Testing the or: ", 9 > 7 || 6 > 8, "\n";
print "Testing the or (version 2): ", 6 > 8 || 9 > 7;
print "\n";

print "Final boolean tests: ", !(3 > 2);
print "\n";
print "Final boolean tests: ", !(2 > 3);
print "\n"; 
