#!perl

use strict;
use warnings;
use Test::More tests => 2;

use_ok( 'Audio::Chromaprint' );

my $called = 0;
package My::Audio::Chromaprint {
    use parent 'Audio::Chromaprint';
    sub DESTROY {
        $called++;
        my $self = shift;
        $self->SUPER::DESTROY(@_);
    }
}

{
    my $cp = My::Audio::Chromaprint->new;
}

cmp_ok( $called, '==', 1, 'Destruction successful' );
