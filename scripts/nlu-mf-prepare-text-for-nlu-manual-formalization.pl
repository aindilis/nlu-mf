#!/usr/bin/perl -w

use BOSS::Config;
use Lingua::EN::Sentence qw(get_sentences);
use PerlLib::SwissArmyKnife;

$specification = q(
	-c <constant>	Constant for text, eg "<BOOKIDENTIFIERCONSTANT>_Book"
	<files>...	Files to be prepared
);

my $config =
  BOSS::Config->new
  (Spec => $specification);
my $conf = $config->CLIConfig;
# $UNIVERSAL::systemdir = "/var/lib/myfrdcsa/codebases/minor/system";

die "No -c argument specified" unless $conf->{'-c'};
die "No files specified" unless $conf->{'<files>'};
# die "Some files don't exist" unless ... $conf->{'<files>'};

my $commands =
  [
   "nlu-mf-prepare-text-for-nlu-manual-formalization-prolog.pl -c ".shell_quote($conf->{'-c'})." ".join(" ",map {shell_quote($_)} @{$conf->{'<files>'}}),
   "nlu-mf-prepare-text-for-nlu-manual-formalization-subl.pl -c ".shell_quote($conf->{'-c'})." ".join(" ",map {shell_quote($_)} @{$conf->{'<files>'}}),
  ];

ApproveCommands
  (
   AutoApprove => 1,
   Commands => $commands,
   );
