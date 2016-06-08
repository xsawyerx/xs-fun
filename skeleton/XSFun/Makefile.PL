use 5.006000;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME           => 'XSFun',
    VERSION_FROM   => 'lib/XSFun.pm',
    PREREQ_PM      => { 'Test::More' => 0, 'Exporter' => '5.57' },
    ABSTRACT_FROM  => 'lib/XSFun.pm',
    AUTHOR         => 'You',
    LIBS           => [''],         # e.g., '-lm'
    DEFINE         => '',           # e.g., '-DHAVE_SOMETHING'
    INC            => '-I.',        # e.g., '-I. -I/usr/include/other'
    OBJECT         => '$(O_FILES)', # link all the C files too
    LICENSE        => 'perl',       # or your choice
    META_MERGE     => {
        resources => {
            repository => {
                type => 'git',
                url  => 'git@github.com:your-github-username/p5-XSFun.git',
                web  => 'https://github.com/your-github-username/p5-XSFun',
            },
        },
        'meta-spec' => { version => 2 },
      },
);
