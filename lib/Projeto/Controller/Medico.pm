use strict;
use warnings;

package Projeto::Controller::Medico;

use base "Catalyst::Example::Controller::InstantCRUD";

sub end :Private {
    my ($self, $c) = @_;
    if ($c->res->code == 302) {
        $c->res->redirect($c->uri_for_action('/projeto/view',$c->stash->{item}->meta->objetivo->projeto_id));
    } else {
        $c->forward('/end');
    }
}

{
    package Projeto::Controller::Medico::MedicoForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    use DateTime;


    has '+item_class' => ( default => 'Medico' );

    has_field 'meta' => ( type => 'Select', );
    has_field 'descricao' => ( type => 'TextArea', required => 1,  rows=>5, cols=>80);
    has_field 'data_medicao' => ( type => 'Date' );
    has_field 'percentual' => ( type => 'Text' );
    has_field 'aceite_registrado' => ( type => 'Date' );
    has_field 'submit' => ( widget => 'submit' );

    sub options_meta {
        my $self = shift;
        return [ map { $_->meta_id => $_->descricao }
                 $self->schema->resultset('Meta')->all ];
    }

}




1;

