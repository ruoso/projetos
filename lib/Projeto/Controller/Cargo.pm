package Projeto::Controller::Cargo;
use strict;
use warnings;
use base "Catalyst::Controller";


{
    package Projeto::Controller::Cargo::CargoForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    has '+item_class' => ( default => 'Cargo' );

    has_field 'descricao' => ( type => 'TextArea', required => 1, rows=>5, cols=>80 );
    has_field 'data_inicio' => ( type => 'Date' );
    has_field 'data_fim' => ( type => 'Date' );
    has_field 'submit' => ( widget => 'submit' )
}

1;

