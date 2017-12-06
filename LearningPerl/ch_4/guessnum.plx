#!/usr/bin/perl
#guessnum.plx
use warnings;
use strict;

#number comparsions
my $target = 12;
print "Guess my number!\n";
print "Enter your guess: ";
my $guess = <STDIN>;

#check for equality
if($target == $guess){
	print "That's it! You guessed correctly!\n";
	#exit after guess
	exit;
}

#check for bigger
if($guess > $target){
	print "Your number is bigger than my number\n";
	exit;
}

#check for less
if($guess < $target){
	print "Your number is less than my number\n";
	exit;
}
