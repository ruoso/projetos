package Projeto::View::XMind::Projeto;

use strict;
use warnings;
use base 'Projeto::View::XMind';

sub translate {
    my ($self, $projeto) = @_;
    my $data =
      { sheet =>
        { topic =>
          [ { id => '123',
              branch => 'folded',
              title => 'Blablabla',
              children =>
              { topics =>
                { topic =>
                  [ { branch => 'folded',
                      title => 'Blobloblo' }
                  ]
                }
              }
            } ]
        }
      };
    return $data;
}

1;
