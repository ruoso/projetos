package Projeto::DBSchema::Result::Alocaco;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Projeto::DBSchema::Result::Alocaco

=cut

__PACKAGE__->table("alocacoes");

=head1 ACCESSORS

=head2 projeto_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pessoa_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 papel_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 data_inicio

  data_type: 'date'
  is_nullable: 0

=head2 data_fim

  data_type: 'date'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "projeto_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pessoa_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "papel_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "data_inicio",
  { data_type => "date", is_nullable => 0 },
  "data_fim",
  { data_type => "date", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("projeto_id", "pessoa_id", "data_inicio", "data_fim");

=head1 RELATIONS

=head2 papel

Type: belongs_to

Related object: L<Projeto::DBSchema::Result::Papei>

=cut

__PACKAGE__->belongs_to(
  "papel",
  "Projeto::DBSchema::Result::Papei",
  { papel_id => "papel_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 pessoa

Type: belongs_to

Related object: L<Projeto::DBSchema::Result::Pessoa>

=cut

__PACKAGE__->belongs_to(
  "pessoa",
  "Projeto::DBSchema::Result::Pessoa",
  { pessoa_id => "pessoa_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
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


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-22 18:29:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:js0mon573mC++VNGJIGFeg


# You can replace this text with custom content, and it will be preserved on regeneration

1;
