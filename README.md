XS Fun
======

Any XS guru will tell you XS is easy. I've heard this many times. While it may
be true, I realized one thing: XS can be scary.

The purpose of this guide is to make XS fun. Yes, fun. Try it out, if you won't
feel as exhilarated as I do as you make your way up the stairs of XS
knowledge, I will fully reimburse your tuition.

Ground rules
------------

1. We use a template instead of [`h2xs`](http://perldoc.perl.org/h2xs.html).
2. We do not bundle an additional C library.
3. We assume you have at least Perl 5.14.2.

These are the best bits of advice I've received so far and they've proven
to be crucial.

`h2xs` is old and crufty, and thus far seems more like a hurdle. Instead,
this guide includes a skeleton for each exercise that you can copy and use
each time you start a new project.

Bundling additional C libraries requires hacks with `ExtUtils::MakeMaker`
(which is a war in and of itself), including tab character nightmares and
additional recursive Makefiles. One way around the obvious "you need to have
this library installed" problem is to provide an `Alien` package. This guide
might go over it at some point but makes no promises.

Eliminating the use of `h2xs` and bundling any C libraries we use (that
we haven't written by ourselves) removes a lot of needless complexity.

Perl 5.14.2 is prevalent enough to consider it a starting ground, though at
this point it is not yet necessarily important.

Relevant resources
------------------

* [perlxs](http://perldoc.perl.org/perlxs.html) (`perldoc perlxs`)
* [perlapi](http://perldoc.perl.org/perlapi.html) (`perldoc perlapi`)

More advanced or specialized resources
--------------------------------------

* [General index](http://perldoc.perl.org/index-internals.html)
* [perlxstypemap](http://perldoc.perl.org/perlxstypemap.html) (`perldoc perlxstypemap`)
* [perlhack](http://perldoc.perl.org/perlhack.html) (`perldoc perlhack`)
* [perlhacktips](http://perldoc.perl.org/perlhacktips.html) (`perldoc perlhacktips`)
* [perlhacktut](http://perldoc.perl.org/perlhacktut.html) (`perldoc perlhacktut`)
* [perlguts](http://perldoc.perl.org/perlguts.html) (`perldoc perlguts`)
* [perlintern](http://perldoc.perl.org/perlintern.html) (`perldoc perlintern`)
* [perlinterp](http://perldoc.perl.org/perlinterp.html) (`perldoc perlinterp`)
* [perlcall](http://perldoc.perl.org/perlcall.html) (`perldoc perlcall`)
* [perlsource](http://perldoc/perl.org/perlsource.html) (`perldoc perlsource`)
