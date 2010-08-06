package Projeto::Controller::Coordenacao;
use base "Catalyst::Controller";
use strict;
use warnings;
use Projeto::Form::Coordenacao;

sub base :Chained('/base') :PathPart('coordenacao') :CaptureArgs(0) {
    my ($self, $c) = @_;
}

sub index :Chained(base) :PathPart('') :Args(0) {}

sub novo :Chained(base) :PathPart :Args(0) {
    my ($self, $c, $id) = @_;
    $c->stash->{form} = Projeto::Form::Coordenacao->new;
    $c->stash->{form}->process( schema => $c->model('DB')->schema,
                                params => $c->req->params );
}

sub dados :Chained(base) :PathPart('') :CaptureArgs(1) {
    my ($self, $c, $id) = @_;

    $id =~ /^\d+$/
      or $c->detach('/default');

    $c->stash->{coordenacao} =
      $c->model('DB::Coordenaco')->find({ coordenacao_id => $id })
        or $c->detach('/default');
}

sub ver :Chained(dados) :PathPart('') :Args(0) {
    my ($self, $c, $id) = @_;
}

sub editar :Chained(dados) :Args(0) {
    my ($self, $c, $id) = @_;
    $c->stash->{form} = Projeto::Form::Coordenacao->new;
    $c->stash->{form}->process( item => $c->stash->{coordenacao},
                                params => $c->req->params );
}

sub remover :Chained(dados) :Args(0) {
    my ($self, $c, $id) = @_;
}

sub xmind :Chained(dados) :Args(0) {
    my ($self, $c) = @_;
    $c->view('XMind::Coordenacao', $c->stash->{coordenacao})->process($c);

}

1;

