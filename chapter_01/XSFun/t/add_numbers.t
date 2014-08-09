#!perl
use strict;
use warnings;

use Test::More tests => 9;

use_ok( 'XSFun', ':all' );

# testing integers
is( add_numbers(  5, 3 ),  8, '5 + 3 = 8'   );
is( add_numbers( 31, 1 ), 32, '31 + 1 = 32' );

is( add_numbers_perl(  5, 3 ),  8, '5 + 3 = 8'   );
is( add_numbers_perl( 31, 1 ), 32, '31 + 1 = 32' );

# testing fractions
is( add_numbers( 3.1, 4.2 ), 7.3, '3.1 + 4.2 = 7.3' );
is( add_numbers( 3.2, 4.3 ), 7.5, '3.2 + 4.3 = 7.5' );

is( add_numbers_perl( 3.1, 4.2 ), 7.3, '3.1 + 4.2 = 7.3' );
is( add_numbers_perl( 3.2, 4.3 ), 7.5, '3.2 + 4.3 = 7.5' );

