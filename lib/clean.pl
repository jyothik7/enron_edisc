#!/usr/bin/perl
use HTML::Entities ();
while ($line=<>){
	print HTML::Entities::encode($line);
}
