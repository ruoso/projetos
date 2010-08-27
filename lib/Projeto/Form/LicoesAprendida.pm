package Projeto::Form::LicoesAprendida;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';

use DateTime;

has '+item_class' => ( default => 'LicoesAprendida' );

has_field 'projeto' => ( type => 'Select', );
has_field 'data' => ( type => 'Date' );
has_field 'descricao' => ( type => 'TextArea', required => 1, rows=>5, cols=>80 );
has_field 'submit' => ( type => 'Submit', value => 'Enviar' );

sub options_projeto {
    my $self = shift;
    return [ map { $_->projeto_id => $_->nome }
             $self->schema->resultset('Projeto')->all ];
}

1;
