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
my $has_text_started = 0;
my $is_not_email = 0;


while (my $line=<>) {
    # Date is there for all valid emails
    if( !$has_date && ($line =~ m/Date:(.*)\r/) ) {
        print "<DATE>".HTML::Entities::encode($1)."</DATE>"."\n";
        $has_date = 1;
    }
    
    if(!$has_x_zlid && $has_date) {        
        
        # If Date is not present in the first line, assume attachment, no special tags required

    
        if( !$has_from && ($line =~ m/From:(.*)\r/) ) {
            print "<FROM>".HTML::Entities::encode($1)."</FROM>"."\n";
            $has_from = 1;
        };
    
        if( !$has_to && ($line =~ m/To:(.*)\r/) ) {
            print "<TO>".HTML::Entities::encode($1)."</TO>"."\n";
            $has_to = 1;
        };
    
        if( !$has_cc && ($line =~ m/Cc:(.*)\r/) ) {
            print "<CC>".HTML::Entities::encode($1)."</CC>"."\n";
            $has_cc = 1;
        };
    
        if( !$has_bcc && ($line =~ m/Bcc:(.*)\r/) ) {
            print "<BCC>".HTML::Entities::encode($1)."</BCC>"."\n";
            $has_bcc = 1;
        };
    
        if( !$has_subject && ($line =~ m/Subject:(.*)\r/) ) {
            print "<SUBJECT>".HTML::Entities::encode($1)."</SUBJECT>"."\n";
            $has_subject = 1;
        };
    
        if( !$has_x_sdoc && ($line =~ m/X-SDOC:(.*)\r/) ) {
            print "<XSDOC>".HTML::Entities::encode($1)."</XSDOC>"."\n";
            $has_x_sdoc = 1;
        };
    
        if( !$has_x_zlid && ($line =~ m/X-ZLID:(.*)\r/) ) {
            print "<XZLID>".HTML::Entities::encode($1)."</XZLID>"."\n";
            $has_x_zlid = 1;
        };
    }
    else{
        if($has_text_started){
            print HTML::Entities::encode($line);
        }
        else{
            print "<TEXT>\n";
            print HTML::Entities::encode($line);
            $has_text_started = 1;
        }
        
    }
    
}

if($has_text_started){
    print "</TEXT>\n";
}

while (my $line=<>) {
    print $line
}