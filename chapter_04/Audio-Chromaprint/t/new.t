#!perl

use strict;
use warnings;
use Test::More tests => 11;
use Test::Fatal;

use_ok( 'Audio::Chromaprint' );

{
    like(
        exception { Audio::Chromaprint->new('SingleInput') },
        qr{^Expecting key/value pairs as input to constructor},
        'Incorrect input for single item (instead of pairs)',
    );

    like(
        exception { Audio::Chromaprint->new( 1, 2, 3 ) },
        qr{^Expecting key/value pairs as input to constructor},
        'Incorrect input for odd items (instead of pairs(',
    );

    is(
        exception { Audio::Chromaprint->new() },
        undef,
        'Successful at calling a constructor without arguments',
    );

    is(
        exception { Audio::Chromaprint->new( key => 'value' ) },
        undef,
        'Successful at calling a constructor with even items',
    );
}

{
    my $cp = Audio::Chromaprint->new();

    isa_ok( $cp, 'Audio::Chromaprint' );
    is(
        $cp->{'algorithm'},
        'test2',
        'Constructor set correct default algorithm',
    );
}

{
    my $cp = Audio::Chromaprint->new(
        algorithm => 'test3'
    );

    isa_ok( $cp, 'Audio::Chromaprint' );
    is(
        $cp->{'algorithm'},
        'test3',
        'Constructor set correct algorithm from argument',
    );

    is(
        exception { $cp->{'algorithm'} = 'test1' },
        undef,
        'We can change the algorithm key directly',
    );

    is(
        $cp->{'algorithm'},
        'test1',
        'It was changed correctly',
    );
}

