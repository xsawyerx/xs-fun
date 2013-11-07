#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <chromaprint.h>

/* C functions */

MODULE = Audio::Chromaprint		PACKAGE = Audio::Chromaprint

# XS code

PROTOTYPES: ENABLED

SV *
new( const char *class )
    CODE:
        /* Create a hash */
        HV* hash = newHV();

        /* Create a reference to the hash */
        SV* const self = newRV_noinc( (SV *)hash );

        /* bless into the proper package */
        RETVAL = sv_bless( self, gv_stashpv( class, 0 ) );
    OUTPUT: RETVAL

const char *
version(SV *self)
    CODE:
        RETVAL = chromaprint_get_version();
    OUTPUT: RETVAL

