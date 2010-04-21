package Projeto::DBSchema::Result::Meta;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "UTF8Columns");

=head1 NAME

Projeto::DBSchema::Result::Meta

=cut

__PACKAGE__->table("metas");

=head1 ACCESSORS

=head2 meta_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'metas_meta_id_seq'

=head2 data_inicio

  data_type: 'date'
  is_nullable: 1

=head2 data_fim

  data_type: 'date'
  is_nullable: 1

=head2 objetivo_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 descricao

  data_type: 'character varying'
  is_nullable: 0
  size: 200

=cut

__PACKAGE__->add_columns(
  "meta_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "metas_meta_id_seq",
  },
  "data_inicio",
  { data_type => "date", is_nullable => 1 },
  "data_fim",
  { data_type => "date", is_nullable => 1 },
  "objetivo_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "descricao",
  { data_type => "character varying", is_nullable => 0, size => 200 },
);
__PACKAGE__->set_primary_key("meta_id");

=head1 RELATIONS

=head2 medicoes

Type: has_many

Related object: L<Projeto::DBSchema::Result::Medico>

=cut

__PACKAGE__->has_many(
  "medicoes",
  "Projeto::DBSchema::Result::Medico",
  { "foreign.meta_id" => "self.meta_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 objetivo

Type: belongs_to

Related object: L<Projeto::DBSchema::Result::Objetivo>

=cut

__PACKAGE__->belongs_to(
  "objetivo",
  "Projeto::DBSchema::Result::Objetivo",
  { objetivo_id => "objetivo_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-20 21:35:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4GLpxBQo0cQi/DVFgKx0GA


# You can replace this text with custom content, and it will be preserved on regeneration
use overload '""' => sub {$_[0]->id}, fallback => 1;
__PACKAGE__->utf8_columns(qw/meta_id data_inicio data_fim objetivo_id descricao/);

1;