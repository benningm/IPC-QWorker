package IPC::QWorker::WorkUnit;

use strict;
use warnings;
use utf8;

sub new($ @) {
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

# vim:ts=2:syntax=perl:
# vim600:foldmethod=marker:
