package Projeto::DBSchema::Result::Objetivo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Projeto::DBSchema::Result::Objetivo

=cut

__PACKAGE__->table("objetivos");

=head1 ACCESSORS

=head2 objetivo_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'objetivos_objetivo_id_seq'

=head2 data_inicio

  data_type: 'date'
  is_nullable: 1

=head2 data_fim

  data_type: 'date'
  is_nullable: 1

=head2 tipo_objetivo_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 descricao

  data_type: 'character varying'
  is_nullable: 0
  size: 2000

=head2 projeto_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "objetivo_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "objetivos_objetivo_id_seq",
  },
  "data_inicio",
  { data_type => "date", is_nullable => 1 },
  "data_fim",
  { data_type => "date", is_nullable => 1 },
  "tipo_objetivo_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "descricao",
  { data_type => "character varying", is_nullable => 0, size => 2000 },
  "projeto_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("objetivo_id");

=head1 RELATIONS

=head2 metas

Type: has_many

Related object: L<Projeto::DBSchema::Result::Meta>

=cut

__PACKAGE__->has_many(
  "metas",
  "Projeto::DBSchema::Result::Meta",
  { "foreign.objetivo_id" => "self.objetivo_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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

=head2 tipo_objetivo

Type: belongs_to

Related object: L<Projeto::DBSchema::Result::TiposObjetivo>

=cut

__PACKAGE__->belongs_to(
  "tipo_objetivo",
  "Projeto::DBSchema::Result::TiposObjetivo",
  { tipo_objetivo_id => "tipo_objetivo_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-22 18:29:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rvRWggKK4ps0SuwYJyEeiQ


# You can replace this text with custom content, and it will be preserved on regeneration

1;
