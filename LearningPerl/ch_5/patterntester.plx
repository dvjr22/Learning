#!/usr/bin/perl
#patterntester.plx
use warnings;
use strict;

$_ = q("I wonder what the Entish is for 'yes' and 'no'," he thought.);
# Tolkien, Lord of the Rings


print "Enter some text to find: ";
my $pattern = <STDIN>;
chomp($pattern);
#takes special characters in $pattern
#ex: Ent+
if(/$pattern/){
	print "The text matches the pattern '$pattern'.\n";
} else {
	print "'$pattern' was not found.\n";
}


=pod
print "Enter some text to find: ";
$pattern = <STDIN>;
chomp($pattern);
#Turn off the usage of special characters in $pattern
#will take all chars as their literal meanings
#ex: Ent+
if(/\Q$pattern\E/){
        print "The text matches the pattern '$pattern'.\n";
} else {
        print "'$pattern' was not found.\n";
}

=cut
