package Projeto::Controller::TiposObjetivo;
use strict;
use warnings;
use base "Catalyst::Controller";


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

