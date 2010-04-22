package Projeto::DBSchema::Result::Medico;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Projeto::DBSchema::Result::Medico

=cut

__PACKAGE__->table("medicoes");

=head1 ACCESSORS

=head2 medicao_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'medicoes_medicao_id_seq'

=head2 data_medicao

  data_type: 'date'
  is_nullable: 1

=head2 meta_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 descricao

  data_type: 'character varying'
  is_nullable: 0
  size: 200

=head2 percentual

  data_type: 'numeric'
  is_nullable: 1
  size: [10,2]

=head2 aceite_registrado

  data_type: 'date'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "medicao_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "medicoes_medicao_id_seq",
  },
  "data_medicao",
  { data_type => "date", is_nullable => 1 },
  "meta_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "descricao",
  { data_type => "character varying", is_nullable => 0, size => 200 },
  "percentual",
  { data_type => "numeric", is_nullable => 1, size => [10, 2] },
  "aceite_registrado",
  { data_type => "date", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("medicao_id");

=head1 RELATIONS

=head2 meta

Type: belongs_to

Related object: L<Projeto::DBSchema::Result::Meta>

=cut

__PACKAGE__->belongs_to(
  "meta",
  "Projeto::DBSchema::Result::Meta",
  { meta_id => "meta_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-22 18:45:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aBuvHX8jb7UZgh+9+BDQlA


# You can replace this text with custom content, and it will be preserved on regeneration

1;
