package Projeto::Form::Coordenaco;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';

use DateTime;

has '+item_class' => ( default => 'Coordenaco' );
has_field 'direcao' => ( type => 'Text', required => 1 );
has_field 'nome' => ( type => 'Text', required => 1, );
has_field 'data_inicio' => ( type => 'Date' );
has_field 'data_fim' => ( type => 'Date' );
has_field 'submit' => ( type => 'Submit', value => 'Enviar' );

1;
