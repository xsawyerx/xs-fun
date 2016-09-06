#!/usr/bin/env perl

use warnings;
use strict;

use Test::More tests => 24;

use FindBin qw($Bin);
use File::Spec::Functions;

my $base_dir = catfile($Bin, "..");

my %chapter_xs_libs = (
    "chapter_01" => "XSFun",
    "chapter_02" => "XSFun",
    "chapter_03" => "Audio-Chromaprint",
    "chapter_04" => "Audio-Chromaprint",
    "chapter_05" => "Audio-Chromaprint",
    "chapter_06" => "Audio-Chromaprint",
    "chapter_07" => "Audio-Chromaprint",
    "chapter_08" => "Audio-Chromaprint",
);

my @chapters = sort keys %chapter_xs_libs;
for my $chapter_name (@chapters) {
    chdir $base_dir;
    my $xs_lib_name = $chapter_xs_libs{$chapter_name};
    my $xs_lib_path = catdir($base_dir, $chapter_name, $xs_lib_name);
    chdir $xs_lib_path;

    if (-e "Makefile") {
        system("make veryclean");
    }
    is(system("perl Makefile.PL"), 0, "Makefile builds successfully");
    is(system("make"), 0, "make runs");
    is(system("make test"), 0, "$xs_lib_name lib tests ok");
}

# vim: expandtab shiftwidth=4
