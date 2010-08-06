package Projeto::Controller::Servico;
use strict;
use warnings;
use base "Catalyst::Controller";
use Projeto::Form::Servico;

sub base :Chained('/base') :PathPart('servico') :CaptureArgs(0) {
    my ($self, $c) = @_;
}

sub index :Chained(base) :PathPart('') :Args(0) {}

sub novo :Chained(base) :PathPart :Args(0) {
    my ($self, $c, $id) = @_;
    $c->stash->{form} = Projeto::Form::Servico->new(schema => $c->model('DB'));
    $c->stash->{form}->process( schema => $c->model('DB')->schema,
                                params => $c->req->params );
}

sub dados :Chained(base) :PathPart('') :CaptureArgs(1) {
    my ($self, $c, $id) = @_;

    $id =~ /^\d+$/
      or $c->detach('/default');

    $c->stash->{servico} =
      $c->model('DB::Servico')->find({ servico_id => $id })
        or $c->detach('/default');
}

sub ver :Chained(dados) :PathPart('') :Args(0) {
    my ($self, $c, $id) = @_;
}

sub editar :Chained(dados) :Args(0) {
    my ($self, $c, $id) = @_;
    $c->stash->{form} = Projeto::Form::Servico->new(schema => $c->model('DB'));
    $c->stash->{form}->process( item => $c->stash->{servico},
                                params => $c->req->params );
}

sub remover :Chained(dados) :Args(0) {
}

sub report :Chained(dados) :Args(0) {
}

sub xmind :Chained(dados) :Args(0) {
    my ($self, $c) = @_;
    $c->view('XMind::Servico', $c->stash->{servico})->process($c);
}


1;

