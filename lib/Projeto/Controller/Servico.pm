use strict;
use warnings;

package Projeto::Controller::Servico;

use base "Catalyst::Example::Controller::InstantCRUD";

sub xmind :Local :Args(1) {
    my ($self, $c, $id) = @_;
    my $servico = $c->model('DBICSchemamodel::Servico')->find
      ({ servico_id => $id });
    #$c->forward($c->view('XMind::Servico', $servico));
    $c->view('XMind::Servico', $servico)->process($c);
}


{
    package Projeto::Controller::Servico::ServicoForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    use DateTime;


    has '+item_class' => ( default => 'Servico' );

    has_field 'coordenacao' => ( type => 'Select', );
    has_field 'nome' => ( type => 'Text', required => 1, );
    has_field 'data_inicio' => ( type => 'Date' );
    has_field 'data_fim' => ( type => 'Date' );
    has_field 'submit' => ( widget => 'submit' );

    sub options_coordenacao {
        my $self = shift;
        return [ map { $_->coordenacao_id => $_->nome }
                 $self->schema->resultset('Coordenaco')->all ];
    }

}


1;

