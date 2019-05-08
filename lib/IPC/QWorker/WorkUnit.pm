package IPC::QWorker::WorkUnit;

use strict;
use warnings;
use utf8;

# ABSTRACT: work unit to process by IPC::QWorker
# VERSION

sub new {
    my $this = shift;
    my $class = ref($this) || $this;
    my $self = {
        'cmd' => undef,
		'params' => undef,
		@_
    };
    bless($self, $class);
    return($self);
}

1;

# vim:ts=2:expandtab:syntax=perl:
