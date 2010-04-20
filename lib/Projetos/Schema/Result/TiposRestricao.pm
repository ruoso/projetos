package Projetos::Schema::Result::TiposRestricao;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Projetos::Schema::Result::TiposRestricao

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

Related object: L<Projetos::Schema::Result::Restrico>

=cut

__PACKAGE__->has_many(
  "restricoes",
  "Projetos::Schema::Result::Restrico",
  { "foreign.tipo_restricao_id" => "self.tipo_restricao_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-20 19:36:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wrAx5EOLDLBB+G5RlBhxoQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
