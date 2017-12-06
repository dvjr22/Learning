#!/usr/bin/perl
#loops.plx
use warnings;
use strict;

#demo next, jumps to next iteration of loop
my @array = (8,3,0,2,12,0);
for (@array){
	if ($_ == 0){
		print "Skipping zero element.\n";
		next;
	}
	print "48 over $_ is ", 48/$_, "\n";
}



my @getout = qw(quit leave stop finish);
#label for while loop
OUTER: while(<STDIN>){
	chomp;
	#label for inner loop
	INNER: for my $check (@getout){
		#break out of loop using lable to break out of while
		last OUTER if $check eq $_;
	}
	print "Hey, you said $_\n";
}
