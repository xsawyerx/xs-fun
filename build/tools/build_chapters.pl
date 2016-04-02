#!/usr/bin/env perl

use warnings;
use strict;

use Modern::Perl;
use File::Spec::Functions qw( catfile catdir splitpath );
use File::Path 'mkpath';

exit main();

sub main {
    build_chapter_pseudopod();

    return 0;
}

sub build_chapter_pseudopod {
    my $chapters_dir = catdir('build', 'chapters');
    mkpath($chapters_dir) unless -d $chapters_dir;

    for my $pod_chapter ( get_chapter_list() ) {
        my $chapter_basename = (splitpath($pod_chapter))[-1];
        my $pseudopod_chapter = catfile($chapters_dir, $chapter_basename);
        my $pseudopod = pod2pseudopod($pod_chapter);
        say "Writing '$pseudopod_chapter from $pod_chapter";
        open my $fh, ">:encoding(utf8)", $pseudopod_chapter
            or die "Cannot write '$pseudopod_chapter': $!";
        print $fh $pseudopod;
        close $fh;
    }
}

sub get_chapter_list {
    my $glob_path = catfile('chapter_??', 'chapter_??.pod');

    return glob($glob_path);
}

sub pod2pseudopod {
    my $pod_path = shift;

    # the solution with decrement_head() and the eval inside the regex was
    # adapated from http://www.perlmonks.org/?node_id=503934
    my $text = read_file($pod_path);
    $text =~ s/^=head(\d)/decrement_head($1)/egm;
    return $text;
}

sub read_file {
    my $path = shift;
    open my $fh, "<:encoding(UTF-8)", $path or die "can't open $path: $!";
    my $text = scalar do { local $/; <$fh>; };
    close $fh;
    return $text;
}

sub decrement_head {
    my $head_level = shift;
    $head_level--;
    return '=head' . $head_level;
}

# vim: expandtab shiftwidth=4 softtabstop=4
