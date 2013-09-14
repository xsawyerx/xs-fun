use 5.008005;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME           => 'XSFun',
    VERSION_FROM   => 'lib/XSFun.pm',
    PREREQ_PM      => { 'Test::More' => 0 },
    ABSTRACT_FROM  => 'lib/XSFun.pm',
    AUTHOR         => 'You',
    LIBS           => [''],         # e.g., '-lm'
    DEFINE         => '',           # e.g., '-DHAVE_SOMETHING'
    INC            => '-I.',        # e.g., '-I. -I/usr/include/other'
    OBJECT         => '$(O_FILES)', # link all the C files too
);

