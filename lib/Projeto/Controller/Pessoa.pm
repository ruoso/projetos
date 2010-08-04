package Projeto::Controller::Pessoa;
use strict;
use warnings;
use base "Catalyst::Controller";


{
    package Projeto::Controller::Pessoa::PessoaForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    with 'HTML::FormHandler::Render::Simple';

    use DateTime;

    has '+item_class' => ( default => 'Pessoa' );

    has_field 'nome' => ( type => 'Text', required => 1, );
    has_field 'tipo_contratacao' => ( type => 'Text', );
    has_field 'salario' => ( type => 'Text', );
    has_field 'custo' => ( type => 'Text', );
    has_field 'cargo' => ( type => 'Select', );
    has_field 'data_inicio' => ( type => 'Date');
    has_field 'data_fim' => ( type => 'Date' );
    has_field 'submit' => ( widget => 'submit' );

    sub options_cargo {
        my $self = shift;
        return [ map { $_->cargo_id => $_->descricao }
                 $self->schema->resultset('Cargo')->all ];
    }
}




1;

