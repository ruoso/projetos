package Projeto::Form::Objetivo;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';

use DateTime;

has '+item_class' => ( default => 'Objetivo' );

has_field 'projeto' => ( type => 'Select', );
has_field 'servico' => ( type => 'Select', );
has_field 'tipo_objetivo' => ( type => 'Select', );
has_field 'descricao' => ( type => 'TextArea', required => 1,  rows=>5, cols=>80);
has_field 'data_inicio' => ( type => 'Date' );
has_field 'data_fim' => ( type => 'Date' );
has_field 'submit' => ( type => 'Submit', value => 'Enviar' );

sub options_projeto {
    my $self = shift;
    return [ '' => 'Nao e relacionado a projeto',
             map { $_->projeto_id => $_->nome }
             $self->schema->resultset('Projeto')->all ];
}

sub options_servico {
    my $self = shift;
    return [ '' => 'Nao e relacionado a servico',
             map { $_->servico_id => $_->nome }
             $self->schema->resultset('Servico')->all ];
}

sub options_tipo_objetivo {
    my $self = shift;
    return [ map { $_->tipo_objetivo_id => $_->nome }
             $self->schema->resultset('TiposObjetivo')->all ];
}

1;
