#!/usr/bin/perl
#look.plx
use warnings;
use strict;

$_ = "fish cake and fish pie";
print "Our original order was ", $_, "\n";

#sub fish w/ cream if cake preceeds fish
s/fish(?= cake)/cream/;
print "Actually, make that ", $_, " instead.\n";

print "\n";

$_ = "fish cake and fish pie";
print "Our original order was ", $_, "\n";
#sub fish w/ cream if fish doesn't preceed cake
s/fish(?! cake)/cream/;
print "Actually, make that ", $_, " instead.\n";

print "\n";

$_ = "fish cake and cream cake";
print "Our original order was ", $_, "\n";
#sub cake with "and chips" if cake follows fish
s/(?<=fish )cake/and chips/;
print "No, wait. I'll have ", $_, " instead\n";
#sub cake with slices if cake doesn't follow fish
s/(?<!fish )cake/slices/;
print "Acutally, make that ", $_, ", will you?\n";
