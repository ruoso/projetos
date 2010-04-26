package Projeto::View::XMind::Projeto;

use strict;
use warnings;
use base 'Projeto::View::XMind';

sub translate {
    my ($self, $projeto) = @_;
    my $data =
      { version => '2.0',
        sheet =>
        { title => 'Projeto: '.$projeto->nome,
          id => $self->get_id, topic =>
          [ { id => $self->get_id,
              'structure-class' => 'org.xmind.ui.tree.right',
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
                   $self->plain_map('Restricoes', sub { return { id => $self->get_id, title => $_->tipo_restricao->nome } },
                                    $projeto->restricoes),
                   $self->plain_map('Objetivos', sub { return { id => $self->get_id, title => $_->descricao } },
                                    $projeto->objetivos),
                   { id => $self->get_id, title => 'Data de Início: '.$projeto->data_inicio->dmy },
                   { id => $self->get_id, title => 'Data de Fim (previsão): '.$projeto->data_fim->dmy },
                   { id => $self->get_id, title => 'Valor: '.$projeto->valor },
                   { id => $self->get_id, title => 'Gerente: '.$projeto->gerente->nome },
                  ]
                }
              }
            } ]
        }
      };
    return $data;
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
    return $self->plain_children($name, \@var);
}

1;
