package Projeto::View::XMind::Servico;

use strict;
use warnings;
use base 'Projeto::View::XMind';

sub translate {
    my ($self, $servico) = @_;
    return
      { version => '2.0',
        sheet =>
        { title => 'Servico: '.$servico->nome,
          topic => $self->mm_servico($servico)
        }
      };
}

sub mm_servico {
    my ($self, $servico) = @_;
    return
      { id => $self->get_id,
        title => $servico->nome,
        children =>
        { topics =>
          { type => 'attached',
            topic =>
            [
             $self->plain_map('Equipe', sub { return { id => $self->get_id, title => $_->pessoa->nome } },
                              $servico->alocacoes({ -and =>
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
             $self->plain_map('Objetivos', sub { return { id => $self->get_id, title => $_->descricao } },
                              $servico->objetivos),
             $servico->data_inicio ?
             { id => $self->get_id, title => 'Data de Início: '.$servico->data_inicio->dmy } : (),
             $servico->data_fim ?
             { id => $self->get_id, title => 'Data de Fim (previsão): '.$servico->data_fim->dmy } : (),
            ]
          }
        }
      };
}

1;
