package Projeto::DBSchema::Result::TiposRestricao;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Projeto::DBSchema::Result::TiposRestricao

=cut

__PACKAGE__->table("tipos_restricao");

=head1 ACCESSORS

=head2 tipo_restricao_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'tipos_restricao_tipo_restricao_id_seq'

=head2 nome

  data_type: 'character varying'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "tipo_restricao_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "tipos_restricao_tipo_restricao_id_seq",
  },
  "nome",
  { data_type => "character varying", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("tipo_restricao_id");

=head1 RELATIONS

=head2 restricoes

Type: has_many

Related object: L<Projeto::DBSchema::Result::Restrico>

=cut

__PACKAGE__->has_many(
  "restricoes",
  "Projeto::DBSchema::Result::Restrico",
  { "foreign.tipo_restricao_id" => "self.tipo_restricao_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-22 18:29:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JixOEvxG2xMem76gVKW0ug


# You can replace this text with custom content, and it will be preserved on regeneration

1;
