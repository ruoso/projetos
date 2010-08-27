package Projeto::Controller::Coordenacao;
use base "Projeto::Controller::Crud";
use strict;
use warnings;

sub base :Chained('/base') :PathPart('coordenacao') :CaptureArgs(0) {
    my ($self, $c) = @_;
    $self->SUPER::base($c, 'coordenacao');
}

sub dados :Chained(base) :PathPart('') :CaptureArgs(1) {
    my ($self, $c, $id) = @_;
    $self->SUPER::dados($c, $id);
    $c->stash->{coordenacao} = $c->stash->{item};
}

sub ver :Chained(dados) :PathPart('') :Args(0) {}

sub xmind :Chained(dados) :Args(0) {
    my ($self, $c) = @_;
    $c->view('XMind::Coordenacao', $c->stash->{coordenacao})->process($c);
}

1;

