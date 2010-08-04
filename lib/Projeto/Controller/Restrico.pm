package Projeto::Controller::Restrico;
use strict;
use warnings;
use base "Catalyst::Controller";

sub end :Private {
    my ($self, $c) = @_;
    if ($c->res->code == 302) {
        $c->res->redirect($c->uri_for_action('/projeto/view',$c->stash->{item}->projeto_id));
    } else {
        $c->forward('/end');
    }
}

{
    package Projeto::Controller::Restrico::RestricoForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';


    has '+item_class' => ( default => 'Restrico' );

    has_field 'projeto' => ( type => 'Select', );
    has_field 'tipo_restricao' => ( type => 'Select', );
    has_field 'importancia' => ( type => 'Integer', required => 1, );
    has_field 'submit' => ( widget => 'submit' );

    sub options_projeto {
        my $self = shift;
        return [ map { $_->projeto_id => $_->nome }
                 $self->schema->resultset('Projeto')->all ];
    }

    sub options_tipo_restricao {
        my $self = shift;
        return [ map { $_->tipo_restricao_id => $_->nome }
                 $self->schema->resultset('TiposRestricao')->all ];
    }
}




1;

