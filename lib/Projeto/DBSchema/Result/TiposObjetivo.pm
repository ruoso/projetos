package Projeto::DBSchema::Result::TiposObjetivo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "UTF8Columns");

=head1 NAME

Projeto::DBSchema::Result::TiposObjetivo

=cut

__PACKAGE__->table("tipos_objetivo");

=head1 ACCESSORS

=head2 tipo_objetivo_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'tipos_objetivo_tipo_objetivo_id_seq'

=head2 nome

  data_type: 'character varying'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "tipo_objetivo_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "tipos_objetivo_tipo_objetivo_id_seq",
  },
  "nome",
  { data_type => "character varying", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("tipo_objetivo_id");

=head1 RELATIONS

=head2 objetivos

Type: has_many

Related object: L<Projeto::DBSchema::Result::Objetivo>

=cut

__PACKAGE__->has_many(
  "objetivos",
  "Projeto::DBSchema::Result::Objetivo",
  { "foreign.tipo_objetivo_id" => "self.tipo_objetivo_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-20 21:35:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8QuHzgjzv2pwEnilPMtJVQ


# You can replace this text with custom content, and it will be preserved on regeneration
use overload '""' => sub {$_[0]->id}, fallback => 1;
__PACKAGE__->utf8_columns(qw/tipo_objetivo_id nome/);

1;