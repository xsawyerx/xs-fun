#!perl
use strict;
use warnings;

use Test::More tests => 2;

use_ok( 'XSFun', ':all' );

is( get_version(), '6.0.0', 'chromaprint version is 6.0.0' );

