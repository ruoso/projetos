package Projeto::DBSchema::Result::Restrico;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Projeto::DBSchema::Result::Restrico

=cut

__PACKAGE__->table("restricoes");

=head1 ACCESSORS

=head2 importancia

  data_type: 'integer'
  is_nullable: 0

=head2 projeto_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 tipo_restricao_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "importancia",
  { data_type => "integer", is_nullable => 0 },
  "projeto_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "tipo_restricao_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("importancia", "projeto_id", "tipo_restricao_id");

=head1 RELATIONS

=head2 projeto

Type: belongs_to

Related object: L<Projeto::DBSchema::Result::Projeto>

=cut

__PACKAGE__->belongs_to(
  "projeto",
  "Projeto::DBSchema::Result::Projeto",
  { projeto_id => "projeto_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 tipo_restricao

Type: belongs_to

Related object: L<Projeto::DBSchema::Result::TiposRestricao>

=cut

__PACKAGE__->belongs_to(
  "tipo_restricao",
  "Projeto::DBSchema::Result::TiposRestricao",
  { tipo_restricao_id => "tipo_restricao_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-22 18:29:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jiXUYhmIQRvYrvJaKZ1p6g


# You can replace this text with custom content, and it will be preserved on regeneration

1;
