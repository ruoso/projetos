use strict;
use warnings;

package Projeto::Controller::Coordenaco;

use base "Catalyst::Example::Controller::InstantCRUD";


{
    package Projeto::Controller::Coordenaco::CoordenacoForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    use DateTime;


    has '+item_class' => ( default => 'Coordenaco' );

    has_field 'nome' => ( type => 'TextArea', required => 1, );
    has_field 'data_fim' => ( type => 'Date' );
    has_field 'data_inicio' => ( type => 'Date' );
    has_field 'submit' => ( widget => 'submit' )
}


1;

