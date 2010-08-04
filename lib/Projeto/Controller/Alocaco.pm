package Projeto::Controller::Alocaco;
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

{
    package Projeto::Controller::Alocaco::AlocacoForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    use DateTime;


    has '+item_class' => ( default => 'Alocaco' );

    has_field 'projeto' => ( type => 'Select', required => 0);
    has_field 'servico' => ( type => 'Select', required => 0);
    has_field 'papel' => ( type => 'Select', );
    has_field 'pessoa' => ( type => 'Select', );
    has_field 'data_inicio' => ( 'Date' );
    has_field 'data_fim' => ( 'Date' );
    has_field 'submit' => ( widget => 'submit' );

    sub options_projeto {
        my $self = shift;
        return [ '' => 'Nao e ligado a projeto',
                 map { $_->projeto_id => $_->nome }
                 $self->schema->resultset('Projeto')->all ];
    }

    sub options_servico {
        my $self = shift;
        return [ '' => 'Nao e ligado a servico',
                 map { $_->servico_id => $_->nome }
                 $self->schema->resultset('Servico')->all ];
    }

    sub options_papel {
        my $self = shift;
        return [ map { $_->papel_id => $_->descricao }
                 $self->schema->resultset('Papei')->all ];
    }

    sub options_pessoa {
        my $self = shift;
        return [ map { $_->pessoa_id => $_->nome }
                 $self->schema->resultset('Pessoa')->all ];
    }

}




1;

