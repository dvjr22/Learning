#!/usr/bin/perl
#convert.plx
use warnings;
use strict;

#declare variables
my($value, $from, $to, $rate, %rates);
#hash of conversion rates
%rates =(
	pounds		=>	1,
	dollars		=>	1.6,
	marks		=>	3.0,
	"french francs"	=>	10.0,
	yen		=>	174.8,
	"swiss francs"	=>	2.43,
	drachma		=>	492.3,
	euro		=>	1.5,
);

#get data
print "Enter your starting currency: ";
$from = <STDIN>;
print "Enter your target currency: ";
$to = <STDIN>;
print "Enter your amount: ";
$value = <STDIN>;

#get rid of new line \n if one is present
chomp($from,$to,$value);

#check if key exists
if(not exists $rates{$to}){
	#print errror and end program
	die "I don't know anything about $to as a currency\n";
}

if(not exists $rates{$from}){
	die "I don't know anything about $from as a currency\n";
}

#get rates
$rate = $rates{$to} / $rates{$from};
#print out results
print "$value $from is ", $value*$rate, " $to.\n";

