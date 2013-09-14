#!perl
use strict;
use warnings;

use Test::More tests => 1;
use XSFun ':all';

is( get_version(), '6.0.0', 'chromaprint version is 6.0.0' );

