package Projeto::Form::Alocaco;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';

use DateTime;

has '+item_class' => ( default => 'Alocaco' );

has_field 'projeto' => ( type => 'Select', required => 0);
has_field 'servico' => ( type => 'Select', required => 0);
has_field 'papel' => ( type => 'Select', );
has_field 'pessoa' => ( type => 'Select', );
has_field 'data_inicio' => ( 'Date' );
has_field 'data_fim' => ( 'Date' );
has_field 'submit' => ( type => 'Submit', value => 'Enviar' );

sub options_projeto {
    my $self = shift;
    return [ '' => 'Nao e ligado a projeto',
             map { $_->projeto_id => $_->nome }
             $self->schema->resultset('Projeto')->all ];
}

sub options_servico {
    my $self = shift;
    return [ '' => 'Nao e ligado a servico',
             map { $_->servico_id => $_->nome }
             $self->schema->resultset('Servico')->all ];
}

sub options_papel {
    my $self = shift;
    return [ map { $_->papel_id => $_->descricao }
             $self->schema->resultset('Papei')->all ];
}

sub options_pessoa {
    my $self = shift;
    return [ map { $_->pessoa_id => $_->nome }
             $self->schema->resultset('Pessoa')->all ];
}

1;
