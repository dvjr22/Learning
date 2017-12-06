#!/usr/bin/perl
#hash.plx
use warnings;
use strict;

#variable
my $place = "Oregon";
#hash
my %where = (
	Gary	=>	"Dallas",
	Lucy	=>	"Exeter",
	Ian	=>	"Reading",
	Samantha	=>	"Oregon"
);
#reverse the list so locations are now keys
my %who = reverse %where;

print "Gary lives in ", $where{Gary}, "\n";
print "Ian lives in $where{Ian}\n";
print "$who{Exeter} lives in Exeter\n";
print "$who{$place} lives in $place\n";
print "\n";

#testing different methods of accessing
print "Gary live in ", %where{Gary}, "\n";
print "Ian lives in %where{Ian}\n";
print "%who{Exeter} lives in Exeter\n";
print "%who{$place} lives in $place\n";
print "\n";

#delete
delete $where{Lucy};
print "Lucy lives in $where{Lucy}\n";
print "\n";

#add
$where{Lucy} = "Exeter";

#iteration
for(keys %where){
	print "$_ lives in $where{$_}\n";
}

