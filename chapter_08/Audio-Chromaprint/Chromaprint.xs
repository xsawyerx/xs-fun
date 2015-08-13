#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <chromaprint.h>

typedef struct {
    int                 algorithm;
    ChromaprintContext* cp_ctx;
} CTX;

typedef CTX* Audio__Chromaprint;

MODULE = Audio::Chromaprint		PACKAGE = Audio::Chromaprint

PROTOTYPES: ENABLED

Audio::Chromaprint
new( const char *class, ... )
    PREINIT:
        CTX* ctx = (CTX *)malloc( sizeof(CTX) );

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
            } else {
                hv_store_ent( hash, key, value, 0 );
            }
        }

        ctx->cp_ctx    = chromaprint_new(algo);
        ctx->algorithm = algo;

        // set all variables in the chromaprint object
        const char *s_threshold = "silence_threshold";
        if ( hv_exists( hash, s_threshold, strlen(s_threshold) ) ) {
            SV **s_threshold_val = hv_fetch( hash, s_threshold, strlen(s_threshold), FALSE );
            chromaprint_set_option(
                ctx->cp_ctx,
                s_threshold,
                SvIV( *s_threshold_val )
            );
        }

        RETVAL = ctx;
    OUTPUT: RETVAL

const char *
version(SV *self)
    CODE:
        RETVAL = chromaprint_get_version();
    OUTPUT: RETVAL

SV *
algorithm(Audio::Chromaprint self)
    CODE:
        RETVAL = newSViv( self->algorithm );
    OUTPUT: RETVAL

void
DESTROY(Audio::Chromaprint self)
    CODE:
        chromaprint_free( self->cp_ctx );
        Safefree(self);
