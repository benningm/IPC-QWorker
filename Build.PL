use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'IPC::QWorker',
    license             => 'restrictive',
    dist_author         => 'Markus Benning <me@w3r3wolf.de>',
    dist_version_from   => 'lib/IPC/QWorker.pm',
);

$builder->create_build_script();

