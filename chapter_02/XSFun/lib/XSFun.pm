package XSFun;

use strict;
use warnings;
use Exporter 5.57 'import';
use XSLoader;

our $VERSION     = '0.001';
our %EXPORT_TAGS = ( 'all' => [qw<get_version>] );
our @EXPORT_OK   = ( @{ $EXPORT_TAGS{'all'} } );

XSLoader::load('XSFun', $VERSION);

1;

=head1 NAME

XSFun - Learning XS the fun way
