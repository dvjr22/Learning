#!/usr/bin/perl
#array.plx
use warnings;
use strict;

my @days;
my $days;
@days = qw(Monday Tuesday Wednesday Thursday Friday Saturday Sunday);
$days = 31;
print @days, "\n";
print $days, "\n";
print "\n";

#assigning an array to a scalar
my $scalar = @days;
print "Days is @days\nScalar is $scalar\n";
print "\n";
my @seasons = qw(Winter Spring Summer Autumn);
$scalar = @seasons;
print "Seasons is @seasons\nScalar is $scalar\n";
print "\n";

#adding to arrays
my @array1 = (1, 2, 3);
my @array2 = (@array1, 4, 5, 6);
print "@array2\n";

@array2 = (3, 5, 7, 9);
@array2 = (1, @array2, 11);
print "@array2\n";
print "\n";

#getting from array
my @array = (1, 3, 5, 7, 9);
print @array[1];
print "\n";
print $array[1];
print "\n";
my $subscript = 3;
print @array[$subscript];
print "\n";
@array[$subscript] = 12;
print @array[$subscript];
print "\n";

# joke machine
my @questions = qw(Java Python Perl C);
my @punchlines = (
	"None. chnge it once, and it's the same everywhere.",
	"One. He just stands below the socket and the world revolves around him.",
	"A million. One to change it, the rest to try and do it in fewer lines.",
	'"Chnage?!!"'
);

print "Please enter a number between 1 and 4: ";
my $selection = <STDIN>;
$selection -= 1;
print "How many $questions[$selection] ";
print "programmers does it take to change a lightbulb?\n\n";
sleep 2;
print $punchlines[$selection], "\n";
print "\n";

#array slices
my @sales = (69, 118, 97, 110, 103, 101, 108, 105, 76, 111, 118, 101);
my @months = qw(jan feb mar may apr jun jul aug sep oct nov dec);
print "Second quarter sales:\n";
print "@months[3..5]\n@sales[3..5]\n";
my @q2 = @sales [3..5];
print "\n";

# incorrect results in mya, aug, oct, nov and dec
@sales[4,7,9..11] = (68,101,114,111,117);
# swap april and may
@months[3,4] = @months[4,3];

# for loop
@array = qw(America Asia Europe Africa);
my $element;
# set each element in the array to $element and print element
for $element (@array){
	print $element, "\n";
}
print "\n";

@array = (10,20,30,40);
print "Before: @array\n";
for (@array){
	$_ *= 2
}
print "After: @array\n";
print "\n";

# joke machine v2
@questions = qw(Java Python Perl C);
@punchlines = (
        "None. chnge it once, and it's the same everywhere.",
        "One. He just stands below the socket and the world revolves around him.",
        "A million. One to change it, the rest to try and do it in fewer lines.",
        '"Chnage?!!"'
);

# $#questions is the highest index of the @questions array.  
# for loop runs from 0 - 3
for(0..$#questions){
	# $_ is used for the current value of the iterator
	print "How many $questions[$_] ";
	print "programmers does it take to change a lightbulb?\n";
	sleep 2;
	print @punchlines[$_], "\n\n";
	sleep 1; 
}

