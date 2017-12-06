#!/usr/bin/perl
#whileloop.plx
use warnings;
use strict;

my $count = 5;

#while loops
while($count > 0){
	print "Counting down $count\n";
	$count--;
}

print "\n";
$count = 5;
#unitl
until($count-- == 0){
	print "Counting down $count\n";
}

print "\n";
print "Enter text to be reversed:";

#while loops w/ stdn
while(<STDIN>){
	chomp;
	#quit unless there is input
	die "!enod 11A\n" unless $_;
	#reverse input
	my $sdrawkcab = reverse $_;
	print "$sdrawkcab\n";
	print "Enter text to be reversed or enter to exit:";
}
