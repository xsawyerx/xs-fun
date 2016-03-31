#!/usr/bin/env perl

use warnings;
use strict;

use Modern::Perl;
use File::Spec::Functions qw( catfile catdir splitpath );
use File::Path 'mkpath';

exit main();

sub main {
    build_chapter_pdf();
    build_main_pdf();

    return 0;
}

sub build_chapter_pdf {
    my $pdf_output_dir = catdir('build', 'pdf');
    mkpath($pdf_output_dir) unless -d $pdf_output_dir;

    for my $pod_chapter ( get_chapter_list() ) {
        my $pdf_chapter = (splitpath($pod_chapter))[-1];
        $pdf_chapter =~ s/pod$/pdf/;
        my $pdf_chapter_path = catfile($pdf_output_dir, $pdf_chapter);

        say "Building $pdf_chapter_path from $pod_chapter";
        qx{pod2pdf --noheader $pod_chapter --output-file $pdf_chapter_path};
    }
}

sub build_main_pdf {
    my $glob_path = catfile('build', 'pdf', 'chapter_??.pdf');
    my $pdf_chapters = join ' ', glob($glob_path);
    my $pdf_main_file = catfile('build', 'pdf', 'xs-fun.pdf');

    say "Building $pdf_main_file";
    qx{pdftk $pdf_chapters cat output $pdf_main_file};
}

sub get_chapter_list {
    my $glob_path = catfile('chapter_??', 'chapter_??.pod');

    return glob($glob_path);
}

# vim: expandtab shiftwidth=4 softtabstop=4
