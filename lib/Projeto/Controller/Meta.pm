package Projeto::Controller::Meta;
use strict;
use warnings;
use base "Catalyst::Controller";



sub end :Private {
    my ($self, $c) = @_;
    if ($c->res->code == 302) {
        $c->res->redirect($c->uri_for_action('/projeto/view',$c->stash->{item}->objetivo->projeto_id));
    } else {
        $c->forward('/end');
    }
}

{
    package Projeto::Controller::Meta::MetaForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    use DateTime;


    has '+item_class' => ( default => 'Meta' );

    has_field 'objetivo' => ( type => 'Select', );
    has_field 'descricao' => ( type => 'TextArea', required => 1,  rows=>5, cols=>80);
    has_field 'data_inicio' => ( type => 'Date' );
    has_field 'data_fim' => ( type => 'Date' );
    has_field 'submit' => ( widget => 'submit' );

    sub options_objetivo {
        my $self = shift;
        return [ map { $_->objetivo_id => $_->descricao }
                 $self->schema->resultset('Objetivo')->all ];
    }


}



1;

