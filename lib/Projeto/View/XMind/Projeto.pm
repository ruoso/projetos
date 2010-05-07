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
    my $data =
      { id => $self->get_id,
        title => $projeto->nome,
        children =>
        { topics =>
          { type => 'attached',
            topic =>
            [
             $self->plain_map('Equipe', sub { return { id => $self->get_id, title => $_->pessoa->nome } },
                              $projeto->alocacoes({ -and =>
                                                    [ { -or =>
                                                        [{ data_fim => undef },
                                                         { data_fim => { '>=' => \"NOW()" }}
                                                        ]
                                                      },
                                                      { -or =>
                                                        [{ data_inicio => undef },
                                                         { data_inicio => { '<=' => \"NOW()" }}
                                                        ]
                                                      }
                                                    ]
                                                  })),
             $self->plain_map('Riscos', sub { return { id => $self->get_id, title => $_->descricao } },
                              $projeto->riscos),
             $self->plain_map('Restricoes',
                              sub { return { id => $self->get_id, title => $_->tipo_restricao->nome } },
                              $projeto->restricoes),
             $self->plain_map('Objetivos', sub { return $self->mm_objetivo($_) },
                              $projeto->objetivos),
             $self->plain_map('Status', sub { return { id => $self->get_id, title => join ' - ', $_->data->dmy, $_->descricao } },
                              $projeto->statuses({},{ order_by => 'data' })),
             $self->plain_map('Lições Aprendidas', sub { return { id => $self->get_id, title => join ' - ', $_->data->dmy, $_->descricao } },
                              $projeto->licoes_aprendidas({},{ order_by => 'data' })),
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

    delete $data->{children} unless
      @{$data->{children}{topics}{topic}};
    return $data;
}

sub mm_objetivo {
    my ($self, $objetivo) = @_;
    my $r =
      {
       id => $self->get_id,
       title => $objetivo->descricao,
       children =>
       { topics =>
         { type => 'attached',
           topic =>
           [
            map { $self->mm_meta($_) } $objetivo->metas
           ]
         }
       }
      };
    delete $r->{children} unless @{$r->{children}{topics}{topic}};
    return $r;
}

sub mm_meta {
    my ($self, $meta) = @_;
    my $r =
      {
       id => $self->get_id,
       title => (join ' - ', ($meta->data_fim->dmy?$meta->data_fim->dmy:()), $meta->descricao),
       children =>
       { topics =>
         { type => 'attached',
           topic =>
           [
            map { $self->mm_medicao($_) } $meta->medicoes
           ]
         }
       }
      };
    delete $r->{children} unless $r->{children}{topics}{topic} &&
      @{$r->{children}{topics}{topic}};
    return $r;
}

sub mm_medicao {
    my ($self, $medicao) = @_;
    return
      {
       id => $self->get_id,
       title => (join ' - ', $medicao->data_medicao->dmy, $medicao->descricao),
      };
}

1;
