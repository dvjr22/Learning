#!/usr/bin/perl
#list.plx
use warnings;
use strict;

print(123, 456, 789);
print "\n";

my $test = 30;
print
	"Here is a list containing strings, (this one) ",
	"numbers (",
	3.6,
	") and variables: ",
	$test, 
	"\n"
;
print "\n";

print (('salt', 'vinegar', 'mustard', 'pepper') [2]);
print "\n";

# accessing elements of a list w/ print
my $month = 3;
print qw( 	January		February	March
		April		May		June
		July		August		September
		October		November	December
) [$month];
print "\n";

$month = -1;
print qw(       January         February        March
                April           May             June
                July            August          September
                October         November        December
) [$month];
print "\n";

my $mone; my $mtwo;
($mone, $mtwo) = (1, 3);
print(("heads ", "shoulders ", "knees ", "toes ") [$mone, $mtwo]);
print "\n";

# ranges in a list
print "Counting up: ", (1 .. 6), "\n";
print "Counting down: ", (6 .. 1), "\n";
print "Counting down (properly this time) : ", reverse(1 .. 6), "\n";

print "Half the alphabet: ", ('a' .. 'm'), "\n";
print "The other half (backwards): ", reverse('n' .. 'z'), "\n";

print "Going from 3 to z: ", (3 .. 'z'), "\n";
print "Going from z to 3: ", ('z' .. 3), "\n";
print "\n";

print (qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec) [2..8]);
print "\n";
print (qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec) [-2..1]);
print "\n";
print (qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec) [0,3,7...11]);
print "\n";


