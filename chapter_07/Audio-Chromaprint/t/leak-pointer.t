#!perl

use strict;
use warnings;
use Test::More tests => 2;
use Test::MemoryGrowth;

use_ok( 'Audio::Chromaprint' );

no_growth { Audio::Chromaprint->new; } 'Does not grow in memory';
