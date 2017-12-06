#!/usr/bin/perl
#match.plx
use warnings;
use strict;

$_ = "Nobody wants to hurt you... 'cept, I do hurt people sometimes, Case.";

#search for pattern people. removes punctuations
if ($_ =~ /people/){
	print "Hooray! Found the word 'people'\n";
}

print "\n";

my $gibson = "Nobody wants to hurt you... 'cept, I do hurt people sometimes, Case.";
#search to see if pattern isn't present
if($gibson !~ /fish/){
	print "There are no fish in William Gibson.\n";
}
print "\n";

#searches for string pattern in default variable $_
if(/I do/){
	print "'I do' is in that string.\n";
}

if(/sometimes Case/){
	print "'sometimes Case' matched.\n";
} else {
	print "No match\n\n";
}

#search for string variable w/ space in front
my $test1 = "The dog is in the kennel";
my $test2 = "The sheepdog is in the field";

if($test1 =~ / dog/){
	print "This dog's at home.\n";
} else {
	print "No match\n";
}
if($test2 =~ / dog/){
	print "This dog's at work.\n";
} else {
        print "No match\n";
}

#search w/o case sensitivity
#i will direct to be case insensitive
if(/case/i) {
	print "I guess it's just the way I'm made.\n";
} else {
	print "Case? Where are you, Case?\n";
}


