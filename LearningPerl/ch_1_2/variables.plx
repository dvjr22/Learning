#!/usr/bin/perl
#variables.plx
use warnings;

# strings
$name = "fred";

print "My name is ". $name. "\n";
print "It is still ", $name, "\n";

$name = "Bill";

print "Well, actually, it's ", $name, "\n";

$name = "fred";

print "No, really, it's ", $name, "\n";
print "\n";

# variable interpoliation
print "My name is $name \n";
print 'My name is $name \n';
print "\n";

$name = "fred";
$salutation = "Dear $name, ";
print $salutation, "\n";
print "\n";
$salutation = "Dear ". $name. ", ";
print "\n";
$time = 8;
print "This is the ${time}th time. \n";
print "\n";
print "This is the ", $time, "th time.\n";
print "\n";

# numbers
$a = 6 * 9;
print "Six nines are ", $a, "\n";

$b = $a + 3;
print "Plus three is ", $b, "\n";

$c = $b / 3;
print "All over three is ", $c, "\n";

$d = $c +1;
print "Add one is ", $d, "\n";
print "\nThose stages again: ", $a, " ", $b, " ", $c, " ", $d, "\n";
print "\n";

$a = 6 * 9;
print "Six nines are ", $a, "\n";

$a += 3;
print "Plus three is ", $a, "\n";

$a /= 3;
print "All over three is ", $a, "\n";

$a += 1;
print "Add one is ", $a, "\n";
print "\n";

$a = 4;
$b = 10;
print "Our variables are ", $a, " and ", $b, "\n";

$b = $a++;
print "Afeter incrementing, we have ", $a, " and ", $b, "\n";

$b = ++$a*2;
print "Now, we have ", $a, " and ", $b, "\n";

$a = --$b+4;
print "Finally, we have ", $a, " and ", $b, "\n";
print "\n";

# auto increment of strings
$a = "A9"; print ++$a, "\n";
$a = "bz"; print ++$a, "\n";
$a = "Zz"; print ++$a, "\n";
$a = "z9"; print ++$a, "\n";
$a = "9z"; print ++$a, "\n";
