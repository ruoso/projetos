package Projeto::Controller::Projeto;
use strict;
use warnings;
use base "Catalyst::Controller";
use Projeto::Form::Projeto;

sub base :Chained('/base') :PathPart('projeto') :CaptureArgs(0) {
    my ($self, $c) = @_;
}

sub index :Chained(base) :PathPart('') :Args(0) {}

sub novo :Chained(base) :PathPart :Args(0) {
    my ($self, $c, $id) = @_;
    $c->stash->{form} = Projeto::Form::Projeto->new(schema => $c->model('DB'));
    $c->stash->{form}->process( schema => $c->model('DB')->schema,
                                params => $c->req->params );
}

sub dados :Chained(base) :PathPart('') :CaptureArgs(1) {
    my ($self, $c, $id) = @_;

    $id =~ /^\d+$/
      or $c->detach('/default');

    $c->stash->{item_id} = $id;

    $c->stash->{projeto} =
      $c->model('DB::Projeto')->find({ projeto_id => $id })
        or $c->detach('/default');
}

sub ver :Chained(dados) :PathPart('') :Args(0) {
    my ($self, $c, $id) = @_;
}

sub editar :Chained(dados) :Args(0) {
    my ($self, $c, $id) = @_;
    $c->stash->{form} = Projeto::Form::Projeto->new(schema => $c->model('DB'));
    $c->stash->{form}->process( item => $c->stash->{projeto},
                                params => $c->req->params );
}

sub remover :Chained(dados) :Args(0) {
    my ($self, $c, $id) = @_;
    if ($c->req->param('confirm')) {
        $c->stash->{projeto}->delete;
        $c->res->redirect($c->uri_for_action($self->action_for('index')));
    }
}

sub report :Chained(dados) :Args(0) {
}

sub xmind :Chained(dados) :Args(0) {
    my ($self, $c) = @_;
    $c->view('XMind::Projeto', $c->stash->{projeto})->process($c);
}

1;

