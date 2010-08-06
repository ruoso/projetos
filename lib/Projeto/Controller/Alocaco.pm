package Projeto::Controller::Alocaco;
use Projeto::Form::Alocacao;
use strict;
use warnings;
use base "Catalyst::Controller";
use utf8;

sub edit :Local {
    my $self = shift;
    my ($c, $id_alocacao) = @_;
    if ($id_alocacao || !$c->req->param('submit')) {
        return $self->SUPER::edit(@_);
    } else {
        # vamos criar um novo objeto alocacao.
        my $a = $c->model('DBICSchemamodel::Alocaco')->create
          ({ projeto_id => $c->req->param('projeto') || undef,
             servico_id => $c->req->param('servico') || undef,
             papel_id   => $c->req->param('papel') || undef,
             pessoa_id  => $c->req->param('pessoa') || undef,
             data_inicio => $c->req->param('data_inicio') || undef,
             data_fim => $c->req->param('data_fim') || undef });
        $c->stash->{item} = $a;
    }
}


sub end :Private {
    my ($self, $c) = @_;
    if ($c->res->code == 302) {
        if ($c->stash->{item}->projeto_id) {
            $c->res->redirect($c->uri_for_action('/projeto/view',$c->stash->{item}->projeto_id));
        } elsif ($c->stash->{item}->servico_id) {
            $c->res->redirect($c->uri_for_action('/servico/view',$c->stash->{item}->servico_id));
        }
    } else {
        $c->forward('/end');
    }
}



1;

