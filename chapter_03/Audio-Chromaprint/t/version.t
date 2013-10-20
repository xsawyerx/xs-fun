#!perl
use strict;
use warnings;

use Test::More tests => 3;
use Audio::Chromaprint;

my $cp = Audio::Chromaprint->new();
isa_ok( $cp, 'Audio::Chromaprint' );
can_ok( $cp, 'version'            );

is( $cp->version, '6.0.0', 'chromaprint version is 6.0.0' );

