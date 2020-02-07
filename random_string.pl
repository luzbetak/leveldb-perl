#!/usr/bin/perl
#----------------------------------------------------------------------#
use String::Random;
$pass = new String::Random;

#print $foo->randregex('\d\d\d'); # Prints 3 random digits
print "Your password is ", $pass->randpattern("cccccccccccc"), "\n";

