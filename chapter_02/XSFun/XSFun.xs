#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <chromaprint.h>

/* C functions */

MODULE = XSFun		PACKAGE = XSFun

# XS code

const char *
get_version()
    CODE:
        RETVAL = chromaprint_get_version();
    OUTPUT: RETVAL

