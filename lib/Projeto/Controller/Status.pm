package Projeto::Controller::Status;
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
    package Projeto::Controller::Status::StatusForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    use DateTime;

    has '+item_class' => ( default => 'Status' );

    has_field 'projeto' => ( type => 'Select', );
    has_field 'descricao' => ( type => 'TextArea', required => 1, rows=>5, cols=>80 );
    has_field 'data' => ( type => 'Date' );
    has_field 'submit' => ( widget => 'submit' );

    sub options_projeto {
        my $self = shift;
        return [ map { $_->projeto_id => $_->nome }
                 $self->schema->resultset('Projeto')->all ];
    }

}




1;

