use 5.008005;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME           => 'Audio::Chromaprint',
    VERSION_FROM   => 'lib/Audio/Chromaprint.pm',
    PREREQ_PM      => { 'Test::More' => 0 },
    ABSTRACT_FROM  => 'lib/Audio/Chromaprint.pm',
    AUTHOR         => 'You',
    LIBS           => ['-lchromaprint'],
    DEFINE         => '',
    INC            => '-I.',
    OBJECT         => '$(O_FILES)',
);

