package Projeto::Controller::Papei;
use strict;
use warnings;
use base "Catalyst::Controller";


{
    package Projeto::Controller::Papei::PapeiForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    use DateTime;


    has '+item_class' => ( default => 'Papei' );

    has_field 'descricao' => ( type => 'Text', required => 1, );
    has_field 'data_inicio' => ( type => 'Date' );
    has_field 'data_fim' => ( type => 'Date' );
    has_field 'submit' => ( widget => 'submit' )
}



1;

