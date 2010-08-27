package Projeto::Controller::Crud;
use strict;
use warnings;
use UNIVERSAL::require;
use base "Catalyst::Controller";

my %resultset_map =
  ( alocacao => 'Alocaco',
    licao => 'LicoesAprendida',
    medicao => 'Medico',
    papel => 'Papei',
    restricao => 'Restrico',
    tipo_objetivo => 'TiposObjetivo',
    tipo_restricao => 'TiposRestricao',
  );

sub base :Chained('/base') :CaptureArgs(1) :PathPart('') {
    my ($self, $c, $entidade) = @_;
    $entidade = lc($entidade);
    my $form_class = 'Projeto::Form::'.ucfirst($entidade);
    $form_class->require
      or $c->detach('/default');

    $c->stash->{form_class} = $form_class;
    $c->stash->{form} = $c->stash->{form_class}->new(schema => $c->model('DB'));
    $c->stash->{entity_name} = $entidade;

    my $rsname;
    if (exists $resultset_map{$entidade}) {
        $rsname = $resultset_map{$entidade};
    } else {
        $rsname = ucfirst($entidade);
    }
    $c->stash->{rs_name} = $rsname;
}

sub index :Chained(base) :PathPart('') :Args(0) {
}

sub novo :Chained(base) :Args(0) {
    my ($self, $c, $id) = @_;
    $c->stash->{form}->process( schema => $c->model('DB')->schema,
                                params => $c->req->params );
}

sub dados :Chained(base) :PathPart('') :CaptureArgs(1) {
    my ($self, $c, $id) = @_;

    $id =~ /^\d+$/
      or $c->detach('/default');

    $c->stash->{item_id} = $id;

    $c->stash->{item} =
      $c->model('DB')->resultset($c->stash->{rs_name})->find({ $c->stash->{entity_name}.'_id' => $id })
        or $c->detach('/default');
}

sub ver :Chained(dados) :PathPart('') :Args(0) {
    my ($self, $c, $id) = @_;
}

sub editar :Chained(dados) :Args(0) {
    my ($self, $c, $id) = @_;
    $c->stash->{form} = $c->stash->{form_class}->new(schema => $c->model('DB'));
    $c->stash->{form}->process( item => $c->stash->{item},
                                params => $c->req->params );
}

sub remover :Chained(dados) :Args(0) {
    my ($self, $c, $id) = @_;
    if ($c->req->param('confirm')) {
        $c->stash->{projeto}->delete;
        $c->res->redirect($c->uri_for_action($self->action_for('index')));
    }
}

sub end :Private {
    my ($self, $c) = @_;
    $c->view('Crud')->process($c);
}

1;
