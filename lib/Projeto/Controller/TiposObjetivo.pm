use strict;
use warnings;

package Projeto::Controller::TiposObjetivo;

use base "Catalyst::Example::Controller::InstantCRUD";


{
    package Projeto::Controller::TiposObjetivo::TiposObjetivoForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    use DateTime;


    has '+item_class' => ( default => 'TiposObjetivo' );

    has_field 'nome' => ( type => 'Text', required => 1, );
    has_field 'submit' => ( widget => 'submit' )
}



1;

