package Projeto::Controller::Servico;
use strict;
use warnings;
use base "Projeto::Controller::Crud";
use Projeto::Form::Servico;

sub base :Chained('/base') :PathPart('servico') :CaptureArgs(0) {
    my ($self, $c) = @_;
    $self->SUPER::base($c, 'servico');
}

sub dados :Chained(base) :PathPart('') :CaptureArgs(1) {
    my ($self, $c, $id) = @_;
    $self->SUPER::dados($c, $id);
    $c->stash->{servico} = $c->stash->{item};
}

sub ver :Chained(dados) :Args(0) {
}

sub report :Chained(dados) :Args(0) {
}

sub xmind :Chained(dados) :Args(0) {
    my ($self, $c) = @_;
    $c->view('XMind::Servico', $c->stash->{servico})->process($c);
}


1;

