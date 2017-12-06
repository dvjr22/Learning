#!/usr/bin/perl
#strings.plx
use warnings;

print "Print ", "several ", "strings ", "here ", "\n";
print "Print ". "one ". "string ". "here". "\n";

print "Four sevens are " . 4 * 7 . "\n";
print "\n";

print "GO! " x3, "\n";
print "Ba". "na" x4, "\n";
print "Ba". "na" x4 * 3 , "\n";
print "Ba". "na" x(4 * 3) , "\n";
print "\n";

#strings to numbers
print "Turning strings to numbers". "\n";
print "12 monkeys" 	+ 0, "\n";
print "Eleven to fly"	+ 0, "\n";
print "UB40"		+ 0, "\n";
print "-20 10"		+ 0, "\n";
print "0x30"		+ 0, "\n";
print "\n";

#asccii string stuff
print "A # has ASCII value ", ord("#"), "\n";
print "A * has ASCII value ", ord("*"), "\n";

#string comparisons
print "Which came first, the chicken or the egg? ";
print "chicken" cmp "egg", "\n";
print "\n";
print "Are dogs greater than cats? ";
print "dog" gt "cat", "\n";
print "\n";
print "Is ^ less than + ? ";
print "^" lt "+", "\n";
print "Test one: ", "four" eq "six", "\n";
print "Test two: ", "four" == "six", "\n";
print "Test three: ", 4 eq 9, "\n";
print "Test four: ", 4 eq 4, "\n";
