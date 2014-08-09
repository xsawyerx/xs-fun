#!perl

use strict;
use warnings;
use Test::More tests => 2;

use_ok( 'Audio::Chromaprint' );

my $called = 0;
package Audio::Chromaprint {
    sub DESTROY {
        $called++;
    }
}

{
    my $cp = Audio::Chromaprint->new;
}

cmp_ok( $called, '==', 1, 'Destruction successful' );
