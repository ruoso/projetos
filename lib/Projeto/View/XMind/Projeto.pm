package Projeto::View::XMind::Projeto;

use strict;
use warnings;
use base 'Projeto::View::XMind';

sub translate {
    my ($self, $projeto) = @_;
    return
      { version => '2.0',
        sheet =>
        { title => 'Projeto: '.$projeto->nome,
          topic => $self->mm_projeto($projeto)
        }
      };
}

sub mm_projeto {
    my ($self, $projeto) = @_;
    return
      { id => $self->get_id,
        title => $projeto->nome,
        children =>
        { topics =>
          { type => 'attached',
            topic =>
            [
             $self->plain_map('Equipe', sub { return { id => $self->get_id, title => $_->pessoa->nome } },
                              $projeto->alocacoes),
             $self->plain_map('Riscos', sub { return { id => $self->get_id, title => $_->descricao } },
                              $projeto->riscos),
             $self->plain_map('Restricoes',
                              sub { return { id => $self->get_id, title => $_->tipo_restricao->nome } },
                              $projeto->restricoes),
             $self->plain_map('Objetivos', sub { return { id => $self->get_id, title => $_->descricao } },
                              $projeto->objetivos),
             $projeto->data_inicio ?
             { id => $self->get_id, title => 'Data de Início: '.$projeto->data_inicio->dmy } : (),
             $projeto->data_fim ?
             { id => $self->get_id, title => 'Data de Fim (previsão): '.$projeto->data_fim->dmy } : (),
             $projeto->valor ?
             { id => $self->get_id, title => 'Valor: '.$projeto->valor } : (),
             $projeto->gerente ?
             { id => $self->get_id, title => 'Gerente: '.$projeto->gerente->nome } : (),
            ]
          }
        }
      };
}

sub plain_children {
    my ($self, $title, $items) = @_;
    return
      { id => $self->get_id,
        title => $title,
        branch => 'folded',
        children => 
        { topics =>
          { type => 'attached',
            topic => $items }
        } }
}

sub plain_map {
    my $self = shift;
    my $name = shift;
    my $closure = shift;
    my @var = map &$closure, @_;
    if (@var) {
        return $self->plain_children($name, \@var);
    } else {
        return ();
    }
}

1;
