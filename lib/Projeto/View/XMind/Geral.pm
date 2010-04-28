package Projeto::View::XMind::Geral;

use strict;
use warnings;
use base qw(Projeto::View::XMind::Projeto
            Projeto::View::XMind::Servico);

sub translate {
    my ($self, $coordenacoes_rs) = @_;
    my %direcoes;
    while (my $coord = $coordenacoes_rs->next) {
        my $dire = $coord->direcao;
        $direcoes{$dire} ||= {};
        $direcoes{$dire}{$coord->nome} =
          [( map { $self->mm_projeto($_) } $coord->projetos->all ),
           ( map { $self->mm_servico($_) } $coord->servicos->all )];
    }

    return
      { version => '2.0',
        sheet =>
        { title => 'CTI',
          topic =>
          { title => 'Coordenadoria de TI',
            children =>
            { topics =>
              { type => 'attached',
                topic =>
                [
                 map { $self->mm_direcao($_, $direcoes{$_}) } keys %direcoes
                ]
              }
            }
          }
        }
      };
}

sub mm_direcao {
    my ($self, $direcao, $coordenacoes) = @_;
    return unless keys %$coordenacoes;
    return
      { title => $direcao,
        children =>
        { topics =>
          { type => 'attached',
            topic =>
            [
             map { $self->mm_coordenacao($_, $coordenacoes->{$_}) } keys %$coordenacoes
            ]
          }
        }
      };
}

sub mm_coordenacao {
    my ($self, $coord, $proj_serv) = @_;
    return unless @$proj_serv;
    return
      { branch => 'folded',
        title => $coord,
        children =>
        { topics =>
          { type => 'attached',
            topic => $proj_serv
          }
        }
      };
}

1;

