package Projeto::DBSchema::Result::Risco;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Projeto::DBSchema::Result::Risco

=cut

__PACKAGE__->table("riscos");

=head1 ACCESSORS

=head2 risco_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'riscos_risco_id_seq'

=head2 data_inicio

  data_type: 'date'
  is_nullable: 1

=head2 data_fim

  data_type: 'date'
  is_nullable: 1

=head2 projeto_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 descricao

  data_type: 'character varying'
  is_nullable: 0
  size: 100

=head2 efeito

  data_type: 'character varying'
  is_nullable: 1

=head2 acao_planejada

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "risco_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "riscos_risco_id_seq",
  },
  "data_inicio",
  { data_type => "date", is_nullable => 1 },
  "data_fim",
  { data_type => "date", is_nullable => 1 },
  "projeto_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "descricao",
  { data_type => "character varying", is_nullable => 0, size => 100 },
  "efeito",
  { data_type => "character varying", is_nullable => 1 },
  "acao_planejada",
  { data_type => "character varying", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("risco_id");

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


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-27 16:43:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6rBgqXYfiQVI7fYUChROgQ


# You can replace this text with custom content, and it will be preserved on regeneration

1;
