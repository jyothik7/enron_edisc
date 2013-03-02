#!/usr/bin/perl

# use HTML::Entities ();
while ($line=<>) {
    if($line =~ /^Date:/) {
        print $line;
    };
    
    
    # print HTML::Entities::encode($line);
}