#!/usr/bin/env perl

use warnings;
use strict;

use Modern::Perl;
use File::Spec::Functions qw( catfile catdir splitpath );
use File::Path 'mkpath';
use Pod::PseudoPod::LaTeX;

exit main();

sub main {
    build_chapter_latex();
    build_main_latex();

    return 0;
}

sub build_chapter_latex {
    my $latex_output_dir = catdir('build', 'pdf');
    mkpath($latex_output_dir) unless -d $latex_output_dir;

    for my $pod_chapter ( get_chapter_list() ) {
        my $latex_chapter = (splitpath($pod_chapter))[-1];
        $latex_chapter =~ s/pod$/tex/;
        my $latex_chapter_path = catfile($latex_output_dir, $latex_chapter);

        say "Building $latex_chapter_path from $pod_chapter";
        open my $fh, ">:encoding(utf8)", $latex_chapter_path
            or die "Can't write '$latex_chapter_path': $!";
        my $parser = Pod::PseudoPod::LaTeX->new();
        $parser->output_fh($fh);
        $parser->parse_file($pod_chapter);
        close $fh;
    }
}

sub build_main_latex {
    my $glob_path = catfile('build', 'pdf', 'chapter_??.tex');
    my @latex_chapters = glob($glob_path);
    my $latex_main_file = catfile('build', 'pdf', 'xs-fun.tex');

    my $preample =<<'EOT';
\documentclass[12pt,a4paper]{scrbook}
\usepackage{fancyvrb}
\usepackage{url}
\usepackage{titleref}
EOT

    my $header =<<'EOT';
\begin{document}
\title{XS Fun}
\author{Sawyer X}
\maketitle

\tableofcontents
EOT

    my $footer = '\end{document}';

    say "Building $latex_main_file";
    open my $fh, ">:encoding(utf8)", $latex_main_file
        or die "Can't write '$latex_main_file': $!";
    say $fh $preample;
    say $fh $header;
    for my $chapter ( @latex_chapters ) {
        $chapter = (splitpath($chapter))[-1];
        say $fh '\input{', $chapter, '}';
    }
    say $fh $footer;
    close $fh;
}

sub get_chapter_list {
    my $glob_path = catfile('build', 'chapters', 'chapter_??.pod');

    return glob($glob_path);
}

# vim: expandtab shiftwidth=4 softtabstop=4
