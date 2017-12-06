#!/usr/bin/perl
#quotes.plx
use warnings;

print '\tThis is a single quoted string.\n';
print "\tThis is a double quoted string.\n";

# using backwhacking
print "\n";
print "C:\\WINNT\\Profiles\\\n";
print 'C:\WINNT\Profiles\ ', "\n";
print 'ex\\ er\\' , ' ci\' se\'' , "\n";

# more backwhacking
print "\n";
print "It's as easy as that. \n";
print '"Stop, " he cried.', "\n";

# examples w/ double quotes
print "\n";
print "\"Hi,\" said Jack. \"Have you read Slashdot today?\"\n";
print '"Hi," said Jack. "Have you read Slashdot today?"', "\n"; 

# alternative delimiters
print "\n";
print qq/"Hi," said Jack. "Have you read Slashdot today?"\n/;

print qq|"Hi," said Jack. "Have you read /. today?"\n|;
print qq#"Hi," said Jack. "Have you read /. today?"\n#;
print qq("Hi," said Jack. "Have you read /. today?"\n);
print qq<"Hi," said Jack. "Have you read /. today?"\n>;

# heredoc
print "\n";
print<<EOF;

This is a here-doc. It starts on the line after the two arrows, and it ends when the text
following the arrows is found at the beginning of a line, like this: 

EOF
