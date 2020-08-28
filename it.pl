#! /usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use File::Glob ':bsd_glob';
use Term::ANSIColor qw/color :constants/;
use Getopt::Long qw/GetOptions :config bundling/;
use File::Basename 'basename';
use File::Path 'make_path';
use List::Util 'any';

my $BLUE = color('ansi69');
my $CYAN = color('ansi45');
my $S = color('bold');
my $R = color('reset');

# Help
sub help() {
   print <<MSG;
${S}SYNOPSIS${R}
${S}OPTIONS${R}
ips vs it?

Import
  - it ip -a?
    it ip/dc : list by default
    it 1.1.1.1/'DC' : info

  - file
  - DB

Input
  - IP => all info
Info
  - ISP
  - range, free?, pub/priv/...
  - location: DC, rack, host name?
${S}DESCRIPTION${R}
MSG
   exit;
}

# Arguments
GetOptions (
   'h|help' => \&help
) or die RED.'Error in command line arguments'.RESET, "\n";

# API
