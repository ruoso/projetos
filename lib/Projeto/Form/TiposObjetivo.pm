package Projeto::Form::TiposObjetivo;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';

use DateTime;

has '+item_class' => ( default => 'TiposObjetivo' );

has_field 'nome' => ( type => 'Text', required => 1, );
has_field 'submit' => ( type => 'Submit', value => 'Enviar' );

1;
