package Projetos::Schema::Result::Coordenaco;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Projetos::Schema::Result::Coordenaco

=cut

__PACKAGE__->table("coordenacoes");

=head1 ACCESSORS

=head2 coordenacao_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'coordenacoes_coordenacao_id_seq'

=head2 data_inicio

  data_type: 'timestamp without time zone'
  is_nullable: 0

=head2 data_fim

  data_type: 'timestamp without time zone'
  is_nullable: 0

=head2 nome

  data_type: 'character varying'
  is_nullable: 0
  size: 100

=cut

__PACKAGE__->add_columns(
  "coordenacao_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "coordenacoes_coordenacao_id_seq",
  },
  "data_inicio",
  { data_type => "timestamp without time zone", is_nullable => 0 },
  "data_fim",
  { data_type => "timestamp without time zone", is_nullable => 0 },
  "nome",
  { data_type => "character varying", is_nullable => 0, size => 100 },
);
__PACKAGE__->set_primary_key("coordenacao_id");

=head1 RELATIONS

=head2 projetos

Type: has_many

Related object: L<Projetos::Schema::Result::Projeto>

=cut

__PACKAGE__->has_many(
  "projetos",
  "Projetos::Schema::Result::Projeto",
  { "foreign.coordenacao_id" => "self.coordenacao_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-20 19:36:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cnACJVfVHOc20LQZJiqzBA

sub display_name {
    my $self = shift;
    $self->nome || '';
}

# You can replace this text with custom content, and it will be preserved on regeneration
1;
