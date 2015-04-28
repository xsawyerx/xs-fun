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
    PREINIT:
        ChromaprintContext *chromaprint_ctx;

    CODE:
        if ( ( items - 1 ) % 2 )
            croak("Expecting a hash as input to constructor");

        HV *hash = newHV();

        int i, algo = CHROMAPRINT_ALGORITHM_DEFAULT;
        for ( i = 1; i < items; i += 2 ) {
            SV *key   = ST(i);
            SV *value = newSVsv( ST( i + 1 ) );

            // we only store unless it's the algorithm
            // then we simply override the value and store it later
            if ( strcmp( SvPV_nolen( ST(i) ), "algorithm" ) == 0 ) {
                const char *algo_v = SvPV_nolen(value);
                // check algorithm options
                if (!strcmp( algo_v, "test1")) {
                    algo = CHROMAPRINT_ALGORITHM_TEST1;
                } else if (!strcmp(algo_v, "test2")) {
                    algo = CHROMAPRINT_ALGORITHM_TEST2;
                } else if (!strcmp(algo_v, "test3")) {
                    algo = CHROMAPRINT_ALGORITHM_TEST3;
                } else if (!strcmp(algo_v, "test4")) {
                    algo = CHROMAPRINT_ALGORITHM_TEST4;
                } else {
                    warn("WARNING: unknown algorithm, using the default");
                }

                algo = SvIV( ST( i + 1 ) );
            } else {
                hv_store_ent( hash, key, value, 0 );
            }
        }

        // store the algorithm
        hv_store(
            hash,
            "algorithm",
            strlen("algorithm"),
            newSViv(algo),
            0
        );

        // print chromaprint_ctx to a new chromaprint object
        chromaprint_ctx = chromaprint_new(algo);

        // store the pointer to the chromaprint object in the hash
        hv_store(
            hash,
            "_cp_ptr",
            strlen("_cp_ptr"),
            newSViv( PTR2IV(chromaprint_ctx) ),
            0
        );

        SV* const self = newRV_noinc( (SV *)hash );

        RETVAL = sv_bless( self, gv_stashpv( class, 0 ) );
    OUTPUT: RETVAL

const char *
version(SV *self)
    CODE:
        RETVAL = chromaprint_get_version();
    OUTPUT: RETVAL
