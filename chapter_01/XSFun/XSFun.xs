#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

/* C functions */

MODULE = XSFun		PACKAGE = XSFun

# XS code

double
add_numbers(double a, double b)
    CODE:
        RETVAL = a + b;
    OUTPUT:
        RETVAL

SV *
add_numbers_perl(SV *a, SV *b)
    CODE:
    {
        const double sum = SvNV(a) + SvNV(b);
        RETVAL = newSVnv(sum);
    }
    OUTPUT: RETVAL

