package Audio::Chromaprint;

use strict;
use warnings;
use XSLoader;

our $VERSION = '0.001';

XSLoader::load( 'Audio::Chromaprint', $VERSION );

1;

__END__

=head1 NAME

Audio::Chromaprint - Interface to the Chromaprint library

