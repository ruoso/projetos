package Projeto::View::XMind::Coordenacao;
use strict;
use warnings;
use base qw(Projeto::View::XMind::Projeto
            Projeto::View::XMind::Servico);

sub translate {
    my ($self, $coord) = @_;
    return
      { version => '2.0',
        sheet =>
        { title => $coord->nome,
          topic => $self->mm_coordenacao($coord->nome,
                                         [( map { $self->mm_projeto($_) } $coord->projetos->all ),
                                          ( map { $self->mm_servico($_) } $coord->servicos->all )])
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
