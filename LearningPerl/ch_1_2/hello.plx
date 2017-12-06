#!/usr/bin/perl
use warnings;

# tell perl where to look for interpreter
# and use warnings

# print a short message
print "Hello, world. \n";
print "Goodbye, world. \n";

# block example
print "\n";
{
	print "\t This is";
	print " a block";
	print " of statements. \n";
}

# line break
print "\n";
print "Top level \n";
{
	print "Second level \n";
	{
		print "Third level \n";
	}
	print "Where are we? \n";
}

# print stuff
print "here ", "we ", "print ", "several ", "strings. \n";
print("here ", "we ", "print ", "several ", "strings. \n");

# numbers
print "\n";
print "Here are some numbers \n";
print "Here is the number 01101: ", 01101, "\n";
print "Here is the number 0xBEEF: ", 0xBEEF, "\n";

# more examples
print "\n";
print "Hi, Mom.\n";
print "Still learning to write in perl.\n";

print "\n";
print "Hi, Mom. \t";
print "Still learning to write in perl.\n";
