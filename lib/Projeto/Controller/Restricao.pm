package Projeto::Controller::Restricao;
use strict;
use warnings;
use base "Projeto::Controller::Crud";

sub base :Chained('/base') :CaptureArgs(0) :PathPart('restricao') {
    my ($self, $c) = @_;
    $self->SUPER::base($c, 'restricao');
}

sub dados :Chained(base) :PathPart('') :CaptureArgs(3) {
    my ($self, $c, $importancia, $projeto_id, $tipo_restricao_id) = @_;

    $c->stash->{item_id} = [  $importancia, $projeto_id, $tipo_restricao_id ];

    $c->stash->{item} =
      $c->model('DB')->resultset($c->stash->{rs_name})->find({ importancia => $importancia,
                                                               projeto_id => $projeto_id,
                                                               tipo_restricao_id => $tipo_restricao_id })
        or $c->detach('/default');
}


1;
