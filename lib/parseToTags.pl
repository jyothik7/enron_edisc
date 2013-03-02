#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

  my $data = 'From: Xochitl-Alexis Velasco
To: Mark Knippa, Mike D Smith, Gerald Nemec, Dave S Laipple, Bo Barnwell
Cc: Melissa Jones, Iris Waser, Pat Radford, Bonnie Shumaker
Subject: Finalize ECS/EES Master Agreement';

  my @values = split(':', $data);
  

for my $elem (@values) {
    state $index;
    say "At index ", $index++, ", $elem";
}

exit 0;