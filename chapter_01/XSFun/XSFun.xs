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

