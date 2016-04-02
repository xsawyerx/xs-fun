use warnings;
use strict;

use Test::More;
use File::Spec::Functions qw( catfile );
use Pod::Checker;

eval { use Test::Pod 1.00 };
plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;

my $glob_path = catfile( 'chapter_??', 'chapter_??.pod' );
my @poddirs = glob $glob_path;
my @pod_files = all_pod_files(@poddirs);

plan tests => @pod_files * 2;
my $checker = Pod::Checker->new();
for my $pod_file ( @pod_files ) {
    $checker->parse_from_file($pod_file);
    is $checker->num_warnings, 0, "Warnings in $pod_file";
    is $checker->num_errors, 0, "Errors in $pod_file";

    # reset the warnings/errors counter ready to test next file
    $checker->num_warnings(0);
    $checker->num_errors(0);
}

# vim: expandtab shiftwidth=4
