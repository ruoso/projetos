use strict;
use warnings;

package Projeto::Controller::Desembolso;

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
    package Projeto::Controller::Desembolso::DesembolsoForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    use DateTime;

    has '+item_class' => ( default => 'Status' );

    has_field 'projeto' => ( type => 'Select', );
    has_field 'data_prevista' => ( type => 'Date' );
    has_field 'valor' => ( type => 'Text' );
    has_field 'data_empenho' => ( type => 'Date' );
    has_field 'empenho' => ( type => 'Text' );
    has_field 'data_nad' => ( type => 'Date' );
    has_field 'nad' => ( type => 'Text' );
    has_field 'data_liquidacao' => ( type => 'Date' );
    has_field 'liquidacao' => ( type => 'Text' );
    has_field 'data_pagamento' => ( type => 'Date' );
    has_field 'pagamento' => ( type => 'Text' );
    has_field 'submit' => ( widget => 'submit' );

    sub options_projeto {
        my $self = shift;
        return [ map { $_->projeto_id => $_->nome }
                 $self->schema->resultset('Projeto')->all ];
    }

}




1;

