# NAME

IPC::QWorker - processing a queue in parallel

# VERSION

version 0.09

# SYNOPSIS

    my $qworker = IPC::QWorker->new();
    
    $qworker->create_workers(10,
      'dump' => sub {
        my $ctx = shift();
        print $$.": ".Dumper(@_)."\n";
        $ctx->{'count'}++;
      },
      '_init' => sub {
        my $ctx = shift();        
        $ctx->{'count'} = 0 ;
      },
      '_destroy' => sub {
        my $ctx = shift();
        print $$.": did ".$ctx->{'count'}." operations!\n";
      }
    );
            
    foreach $i (1..120) {
      $qworker->push_queue(
        IPC::QWorker::WorkUnit->new(
          'cmd' => 'dump',
          'params' => $i,
        )
      );
    }
    
    $qworker->process_queue();

          # wait till queue is emtpy
    $qworker->flush_queue();
          # then stop all workers
    $qworker->stop_workers();

## EXPORT

None by default.

# DESCRIPTION

With this module you can fork a few child processes which know a few
function calls you define while creating them.
Later you can pass command with parameters into the queue which is
distributed across the child processes thru pipes(with the Storable module).

# SEE ALSO

    perl, POSIX, Storable, IO::Select

# AUTHOR

Markus Benning <ich@markusbenning.de>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Markus Benning <ich@markusbenning.de>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
