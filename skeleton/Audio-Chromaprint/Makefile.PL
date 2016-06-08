use 5.006000;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME           => 'Audio::Chromaprint',
    VERSION_FROM   => 'lib/Audio/Chromaprint.pm',
    PREREQ_PM      => { 'Test::More' => 0 },
    ABSTRACT_FROM  => 'lib/Audio/Chromaprint.pm',
    AUTHOR         => 'You',
    LIBS           => ['-lchromaprint'],
    DEFINE         => '',           # e.g., '-DHAVE_SOMETHING'
    INC            => '-I.',        # e.g., '-I. -I/usr/include/other'
    OBJECT         => '$(O_FILES)', # link all the C files too
    LICENSE        => 'perl',       # or your choice
    META_MERGE     => {
        resources => {
            repository => {
                type => 'git',
                url  => 'git@github.com:your-github-username/p5-Audio-Chromaprint.git',
                web  => 'https://github.com/your-github-username/p5-Audio-Chromaprint',
            },
        },
        'meta-spec' => { version => 2 },
      },
);
