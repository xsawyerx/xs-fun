#!perl
use strict;
use warnings;

use Test::More tests => 2;

use_ok( 'XSFun', ':all' );

is( get_version(), '1.2.0', 'chromaprint version is 1.2.0' );

