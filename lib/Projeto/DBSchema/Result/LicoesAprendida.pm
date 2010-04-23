package Projeto::DBSchema::Result::LicoesAprendida;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Projeto::DBSchema::Result::LicoesAprendida

=cut

__PACKAGE__->table("licoes_aprendidas");

=head1 ACCESSORS

=head2 licao_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'licoes_aprendidas_licao_id_seq'

=head2 projeto_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 data

  data_type: 'date'
  is_nullable: 0

=head2 descricao

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "licao_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "licoes_aprendidas_licao_id_seq",
  },
  "projeto_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "data",
  { data_type => "date", is_nullable => 0 },
  "descricao",
  { data_type => "character varying", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("licao_id");

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


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-23 11:08:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:G6c0mrv8OkrzD5fPgNTyuQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
