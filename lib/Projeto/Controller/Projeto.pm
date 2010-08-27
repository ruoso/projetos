package Projeto::Controller::Projeto;
use strict;
use warnings;
use base "Projeto::Controller::Crud";
use Projeto::Form::Projeto;

sub base :Chained('/base') :PathPart('projeto') :CaptureArgs(0) {
    my ($self, $c) = @_;
    $self->SUPER::base($c, 'projeto');
}

sub dados :Chained(base) :PathPart('') :CaptureArgs(1) {
    my ($self, $c, $id) = @_;
    $self->SUPER::dados($c, $id);
    $c->stash->{projeto} = $c->stash->{item};
}

sub ver :Chained(dados) :Args(0) {
}

sub report :Chained(dados) :Args(0) {
}

sub xmind :Chained(dados) :Args(0) {
    my ($self, $c) = @_;
    $c->view('XMind::Projeto', $c->stash->{projeto})->process($c);
}

1;

