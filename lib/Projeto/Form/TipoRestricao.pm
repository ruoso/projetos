package Projeto::Form::TipoRestricao;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';

has '+item_class' => ( default => 'TiposRestricao' );

has_field 'nome' => ( type => 'Text', required => 1, );
has_field 'submit' => ( type => 'Submit', value => 'Enviar' );

1;
