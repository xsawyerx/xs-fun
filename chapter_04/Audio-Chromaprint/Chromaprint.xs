#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <chromaprint.h>

MODULE = Audio::Chromaprint		PACKAGE = Audio::Chromaprint

PROTOTYPES: ENABLED

SV *
new( const char *class, ... )
    CODE:
        if ( ( items - 1 ) % 2 )
            croak("Expecting a hash as input to constructor");

        HV *hash = newHV();

        hv_store(
            hash,
            "algorithm",
            strlen("algorithm"),
            newSVpv( "test2", strlen("test2") ),
            0
        );

        int i;
        for ( i = 1; i < items; i += 2 ) {
            SV *key   = ST(i);
            SV *value = newSVsv( ST( i + 1 ) );

            hv_store_ent( hash, key, value, 0 );
        }

        SV* const self = newRV_noinc( (SV *)hash );

        RETVAL = sv_bless( self, gv_stashpv( class, 0 ) );
    OUTPUT: RETVAL

const char *
version(SV *self)
    CODE:
        RETVAL = chromaprint_get_version();
    OUTPUT: RETVAL

