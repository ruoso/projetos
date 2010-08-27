package Projeto::View::Crud;
use strict;
use warnings;
use base 'Projeto::View::TT';

my %columns =
  (
  );

sub process {
    my $self = shift;
    my $c = shift;
#    $c->stash->{columns} = $columns{$c->stash->{entity_name}};
    $self->next::method($c, @_);
}

1;
