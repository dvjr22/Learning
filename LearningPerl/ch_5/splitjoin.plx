#!/usr/bin/perl
#splitjoin.plx
use warnings;
use strict;

my $passwd = "kake:x:10018:10020::/home/kake:/bin/bash";
#split $passwd by delimeter : and add each to @fields
my @fields = split /:/, $passwd;
#print the array fields
print "Login name : $fields[0]\n";
print "User ID : $fields[2]\n";
print "Home directory : $fields[5]\n";

#join the elements in @fields with #
my $passwd2 = join "#", @fields;
print "Original password : $passwd\n";
print "New password :      $passwd2\n";

