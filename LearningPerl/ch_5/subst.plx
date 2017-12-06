#!/usr/bin/perl
#subst.plx
use warnings;
use strict;

$_ = "Awake! Awake! Fear, Fire, Foes! Awake! Fire, Foes! Awake!";
# Tolkien, Lord of the Rings
print $_, "\n";

#substitute the first occurence of "Foes" with "Flee"
s/Foes/Flee/;
print $_, "\n";

#substitute every occurence of "Foes" with "Flee"
#g applies substitution globally
s/Foes/Flee/g;
print $_, "\n";

print "\n";

$_ = "there are two major products that come out of Berkeley: LSD and UNIX";
# Jeremy Anderson
print $_, "\n";

#swap the first two words in the string
s/(\w+)\s+(\w+)/$2 $1/;
print $_, "/\n";

#apply swap globally
s/(\w+)\s+(\w+)/$2 $1/g;
print $_, "/\n";

