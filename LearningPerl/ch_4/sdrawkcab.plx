#!/usr/bin/perl
#sdrawkacb.plx
use warnings;
use strict;

print "Enter text:";
# 0 = false
my $stopnow = 0;
# until works like while(!condition) read until true
until ($stopnow){
	$_ = <STDIN>;
	chomp;
	#if $_ is not empty
	if($_) {
		my $sdrawkcab = reverse $_;
		print "$sdrawkcab\n";
	#if $_ is empty, set $stopnow to true, which ends loop
	} else {
		$stopnow = 1;
	}
}
print "!enod 11A\n";

print "\n";
print "Enter text:";

#testing last
while (<STDIN>) {
	chomp;
	#last functions like break; breaks out of loop
	#unless like if(!condition) read unless true
	last unless $_;
	my $sdrawkcab = reverse $_;
	print "$sdrawkcab\n";
}

print "!enod 11A\n";

print "\n";
print "Testing last(break)\n";

#testing last w/ an array
my @array = ("red", "blue", "STOP THIS NOW", "green");
#itterate over array
for (@array) {
	#break after "STOP..."
	last if $_ eq "STOP THIS NOW";
	print "Today's color is $_\n";
}

