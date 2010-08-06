package Projeto::Form::Medicao;
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
has_field 'submit' => ( type => 'Submit', value => 'Enviar' );

sub options_meta {
    my $self = shift;
    return [ map { $_->meta_id => $_->descricao }
             $self->schema->resultset('Meta')->all ];
}

1;
