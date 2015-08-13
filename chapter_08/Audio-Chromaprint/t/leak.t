#!perl

use strict;
use warnings;
use Test::More tests => 2;

use_ok( 'Audio::Chromaprint' );

my $called = 0;
{
    no warnings qw<redefine once>;
    *Audio::Chromaprint::DESTROY = sub ($) {
        $called++;
    };
}

{
    my $cp = Audio::Chromaprint->new;
}

cmp_ok( $called, '==', 1, 'Destruction successful' );
