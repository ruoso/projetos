use strict;
use warnings;

package Projeto::Controller::Cargo;

use base "Catalyst::Example::Controller::InstantCRUD";


{
    package Projeto::Controller::Cargo::CargoForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    has '+item_class' => ( default => 'Cargo' );

    has_field 'descricao' => ( type => 'TextArea', required => 1, );
    has_field 'data_fim' => ( type => 'Date' );
    has_field 'data_inicio' => ( type => 'Date' );
    has_field 'submit' => ( widget => 'submit' )
}

1;

