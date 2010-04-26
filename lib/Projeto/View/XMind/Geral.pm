package Projeto::View::XMind::Geral;

use strict;
use warnings;
use base 'Projeto::View::XMind::Projeto';

sub translate {
    my ($self, $projetos_rs) = @_;
    my %direcoes;
    while (my $projeto = $projetos_rs->next) {
        my $coord = $projeto->coordenacao;
        my $dire = $coord->direcao;
        $direcoes{$dire} ||= {};
        $direcoes{$dire}{$coord->nome} ||= [];
        push @{$direcoes{$dire}{$coord->nome}}, $self->mm_projeto($projeto);
    }

    return
      { version => '2.0',
        sheet =>
        { title => 'Projetos CTI',
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
    my ($self, $coord, $projetos) = @_;
    return
      { branch => 'folded',
        title => $coord,
        children =>
        { topics =>
          { type => 'attached',
            topic => $projetos
          }
        }
      };
}

1;

