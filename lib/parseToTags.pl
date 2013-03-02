#!/usr/bin/perl
use HTML::Entities ();
use strict;

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
        print HTML::Entities::encode("<DATE>".$1."</DATE>"."\n");
        $has_date = 1;
    };
    
    if( !$has_from && ($line =~ m/From:(.*)\r/) ) {
        print HTML::Entities::encode("<FROM>".$1."</FROM>"."\n");
        $has_from = 1;
    };
    
    if( !$has_to && ($line =~ m/To:(.*)\r/) ) {
        print HTML::Entities::encode("<TO>".$1."</TO>"."\n");
        $has_to = 1;
    };
    
    if( !$has_cc && ($line =~ m/Cc:(.*)\r/) ) {
        print HTML::Entities::encode("<CC>".$1."</CC>"."\n");
        $has_cc = 1;
    };
    
    if( !$has_bcc && ($line =~ m/Bcc:(.*)\r/) ) {
        print HTML::Entities::encode("<BCC>".$1."</BCC>"."\n");
        $has_bcc = 1;
    };
    
    if( !$has_subject && ($line =~ m/Subject:(.*)\r/) ) {
        print HTML::Entities::encode("<SUBJECT>".$1."</SUBJECT>"."\n");
        $has_subject = 1;
    };
    
    if( !$has_x_sdoc && ($line =~ m/X-SDOC:(.*)\r/) ) {
        print HTML::Entities::encode("<XSDOC>".$1."</XSDOC>"."\n");
        $has_x_sdoc = 1;
    };
    
    if( !$has_x_zlid && ($line =~ m/X-ZLID:(.*)\r/) ) {
        print HTML::Entities::encode("<XZLID>".$1."</XZLID>"."\n");
        $has_x_zlid = 1;
    };
    
    # print HTML::Entities::encode($line);
}