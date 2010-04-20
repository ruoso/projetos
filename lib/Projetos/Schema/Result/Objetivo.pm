package Projetos::Schema::Result::Objetivo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Projetos::Schema::Result::Objetivo

=cut

__PACKAGE__->table("objetivos");

=head1 ACCESSORS

=head2 objetivo_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'objetivos_objetivo_id_seq'

=head2 data_inicio

  data_type: 'timestamp without time zone'
  is_nullable: 0

=head2 data_fim

  data_type: 'timestamp without time zone'
  is_nullable: 0

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
  { data_type => "timestamp without time zone", is_nullable => 0 },
  "data_fim",
  { data_type => "timestamp without time zone", is_nullable => 0 },
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

Related object: L<Projetos::Schema::Result::Meta>

=cut

__PACKAGE__->has_many(
  "metas",
  "Projetos::Schema::Result::Meta",
  { "foreign.objetivo_id" => "self.objetivo_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 projeto

Type: belongs_to

Related object: L<Projetos::Schema::Result::Projeto>

=cut

__PACKAGE__->belongs_to(
  "projeto",
  "Projetos::Schema::Result::Projeto",
  { projeto_id => "projeto_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 tipo_objetivo

Type: belongs_to

Related object: L<Projetos::Schema::Result::TiposObjetivo>

=cut

__PACKAGE__->belongs_to(
  "tipo_objetivo",
  "Projetos::Schema::Result::TiposObjetivo",
  { tipo_objetivo_id => "tipo_objetivo_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-20 19:36:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:j3SXyV2veS5Of2MVX7ugfA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
