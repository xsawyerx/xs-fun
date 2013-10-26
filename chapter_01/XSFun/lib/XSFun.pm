package XSFun;

use strict;
use warnings;
use Exporter;
use XSLoader;

use base 'Exporter';

our $VERSION     = '0.001';
our %EXPORT_TAGS = ( 'all' => [qw<add_numbers add_numbers_perl>] );
our @EXPORT_OK   = ( @{ $EXPORT_TAGS{'all'} } );

XSLoader::load('XSFun', $VERSION);

1;

=head1 NAME

XSFun - Learning XS the fun way
