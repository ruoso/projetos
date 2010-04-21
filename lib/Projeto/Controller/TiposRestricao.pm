use strict;
use warnings;

package Projeto::Controller::TiposRestricao;

use base "Catalyst::Example::Controller::InstantCRUD";


{
    package Projeto::Controller::TiposRestricao::TiposRestricaoForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';


    has '+item_class' => ( default => 'TiposRestricao' );

    has_field 'nome' => ( type => 'Text', required => 1, );
    has_field 'submit' => ( widget => 'submit' )
}




1;

