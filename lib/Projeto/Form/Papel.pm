package Projeto::Form::Papel;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';

use DateTime;

has '+item_class' => ( default => 'Papei' );

has_field 'descricao' => ( type => 'Text', required => 1, );
has_field 'data_inicio' => ( type => 'Date' );
has_field 'data_fim' => ( type => 'Date' );
has_field 'submit' => ( type => 'Submit', value => 'Enviar' )

1;

