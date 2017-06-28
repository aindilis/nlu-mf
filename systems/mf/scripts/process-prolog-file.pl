#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;

my $c = read_file('<PROLOGFILENAME>');

my @group;
my @toanalyze;
foreach my $line (split /\n/, $c) {
  unless ($line) {
    if (scalar @toanalyze) {
      my @tmp = @toanalyze;
      push @group, \@tmp;
      @toanalyze = ();
    }
  } elsif ($line =~ /^\s*\%+\s*(.+)$/) {
    push @toanalyze, $1;
  }
}
if (scalar @toanalyze) {
  push @group, \@toanalyze;
}

print Dumper(\@group);
