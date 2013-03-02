#!/usr/bin/perl
use strict;
# use HTML::Entities ();

# declare "only use once" flags
my $has_date = 0;
my $has_from = 0;
my $has_to = 0;
my $has_cc = 0;
my $has_bcc = 0;
my $has_subject = 0;
my $has_x_sdoc = 0;
my $has_x_zlid = 0;


while (my $line=<>) {
    if( !$has_date && ($line =~ m/Date:(.*)\r/) ) {
        print "<DATE>".$1."</DATE>"."\n";
        $has_date = 1;
    };
    
    if( !$has_from && ($line =~ m/From:(.*)\r/) ) {
        print "<FROM>".$1."</FROM>"."\n";
        $has_from = 1;
    };
    
    if( !$has_to && ($line =~ m/To:(.*)\r/) ) {
        print "<TO>".$1."</TO>"."\n";
        $has_to = 1;
    };
    
    if( !$has_cc && ($line =~ m/Cc:(.*)\r/) ) {
        print "<CC>".$1."</CC>"."\n";
        $has_cc = 1;
    };
    
    # print HTML::Entities::encode($line);
}