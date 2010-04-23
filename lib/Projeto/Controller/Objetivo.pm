use strict;
use warnings;

package Projeto::Controller::Objetivo;

use base "Catalyst::Example::Controller::InstantCRUD";

sub end :Private {
    my ($self, $c) = @_;
    if ($c->res->code == 302) {
        $c->res->redirect($c->uri_for_action('/projeto/view',$c->stash->{item}->projeto_id));
    } else {
        $c->forward('/end');
    }
}

{
    package Projeto::Controller::Objetivo::ObjetivoForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    use DateTime;


    has '+item_class' => ( default => 'Objetivo' );

    has_field 'projeto' => ( type => 'Select', );
    has_field 'tipo_objetivo' => ( type => 'Select', );
    has_field 'descricao' => ( type => 'TextArea', required => 1, );
    has_field 'data_inicio' => ( type => 'Date' );
    has_field 'data_fim' => ( type => 'Date' );
    has_field 'submit' => ( widget => 'submit' );

    sub options_projeto {
        my $self = shift;
        return [ map { $_->projeto_id => $_->nome }
                 $self->schema->resultset('Projeto')->all ];
    }

    sub options_tipo_objetivo {
        my $self = shift;
        return [ map { $_->tipo_objetivo_id => $_->nome }
                 $self->schema->resultset('TiposObjetivo')->all ];
    }

}




1;

