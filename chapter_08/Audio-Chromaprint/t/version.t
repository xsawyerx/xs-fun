#!perl
use strict;
use warnings;

use Test::More tests => 4;

use_ok( 'Audio::Chromaprint' );

my $cp = Audio::Chromaprint->new();
isa_ok( $cp, 'Audio::Chromaprint' );
can_ok( $cp, 'version'            );

is( $cp->version, '1.2.0', 'chromaprint version is 1.2.0' );
