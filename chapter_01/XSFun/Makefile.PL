use 5.008005;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME           => 'XSFun',
    VERSION_FROM   => 'lib/XSFun.pm',
    PREREQ_PM      => { 'Test::More' => 0 },
    ABSTRACT_FROM  => 'lib/XSFun.pm',
    AUTHOR         => 'You',
    LIBS           => [''],
    DEFINE         => '',
    INC            => '-I.',
    OBJECT         => '$(O_FILES)',
);

