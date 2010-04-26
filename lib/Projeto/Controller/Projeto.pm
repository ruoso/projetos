use strict;
use warnings;

package Projeto::Controller::Projeto;

use base "Catalyst::Example::Controller::InstantCRUD";

sub report :Local :Args(1) {
    my ($self, $c, $id) = @_;
    $c->stash->{item} = $c->model('DBICSchemamodel::Projeto')->find
      ({ projeto_id => $id });
}


{
    package Projeto::Controller::Projeto::ProjetoForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    use DateTime;


    has '+item_class' => ( default => 'Projeto' );

    has_field 'coordenacao' => ( type => 'Select', );
    has_field 'gerente' => ( type => 'Select', );
    has_field 'nome' => ( type => 'Text', required => 1, );
    has_field 'status' => ( type => 'TextArea', );
    has_field 'valor' => ( type => 'TextArea', );
    has_field 'data_inicio' => ( type => 'Date' );
    has_field 'data_fim' => ( type => 'Date' );
    has_field 'submit' => ( widget => 'submit' );

    sub options_coordenacao {
        my $self = shift;
        return [ map { $_->coordenacao_id => $_->nome }
                 $self->schema->resultset('Coordenaco')->all ];
    }

    sub options_gerente {
        my $self = shift;
        return [ map { $_->pessoa_id => $_->nome }
                 $self->schema->resultset('Pessoa')->all ];
    }

}


1;

