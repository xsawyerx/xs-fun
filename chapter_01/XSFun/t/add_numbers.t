#!perl
use strict;
use warnings;

use Test::More tests => 4;
use XSFun 'add_numbers';

# testing integers
cmp_ok( add_numbers( 5,  3 ), '==',  8, '5 + 3 = 8'   );
cmp_ok( add_numbers( 31, 1 ), '==', 32, '31 + 1 = 32' );

# testing fractions
cmp_ok( add_numbers( 3.1, 4.2 ), '==', 7.3, '3.1 + 4.2 = 7.3' );
cmp_ok( add_numbers( 3.2, 4.3 ), '==', 7.5, '3.2 + 4.3 = 7.5' );

