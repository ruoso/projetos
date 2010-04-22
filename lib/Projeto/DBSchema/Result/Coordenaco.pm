package Projeto::DBSchema::Result::Coordenaco;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Projeto::DBSchema::Result::Coordenaco

=cut

__PACKAGE__->table("coordenacoes");

=head1 ACCESSORS

=head2 coordenacao_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'coordenacoes_coordenacao_id_seq'

=head2 data_inicio

  data_type: 'date'
  is_nullable: 1

=head2 data_fim

  data_type: 'date'
  is_nullable: 1

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
  { data_type => "date", is_nullable => 1 },
  "data_fim",
  { data_type => "date", is_nullable => 1 },
  "nome",
  { data_type => "character varying", is_nullable => 0, size => 100 },
);
__PACKAGE__->set_primary_key("coordenacao_id");

=head1 RELATIONS

=head2 projetos

Type: has_many

Related object: L<Projeto::DBSchema::Result::Projeto>

=cut

__PACKAGE__->has_many(
  "projetos",
  "Projeto::DBSchema::Result::Projeto",
  { "foreign.coordenacao_id" => "self.coordenacao_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-22 18:29:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3krkt/UNMJjP1rcXtx6L+Q


# You can replace this text with custom content, and it will be preserved on regeneration

1;
