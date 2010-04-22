package Projeto::DBSchema::Result::Projeto;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Projeto::DBSchema::Result::Projeto

=cut

__PACKAGE__->table("projetos");

=head1 ACCESSORS

=head2 projeto_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'projetos_projeto_id_seq'

=head2 data_inicio

  data_type: 'date'
  is_nullable: 1

=head2 data_fim

  data_type: 'date'
  is_nullable: 1

=head2 nome

  data_type: 'character varying'
  is_nullable: 0
  size: 100

=head2 gerente_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 coordenacao_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 valor

  data_type: 'numeric'
  is_nullable: 1
  size: [10,2]

=cut

__PACKAGE__->add_columns(
  "projeto_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "projetos_projeto_id_seq",
  },
  "data_inicio",
  { data_type => "date", is_nullable => 1 },
  "data_fim",
  { data_type => "date", is_nullable => 1 },
  "nome",
  { data_type => "character varying", is_nullable => 0, size => 100 },
  "gerente_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "coordenacao_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "valor",
  { data_type => "numeric", is_nullable => 1, size => [10, 2] },
);
__PACKAGE__->set_primary_key("projeto_id");

=head1 RELATIONS

=head2 alocacoes

Type: has_many

Related object: L<Projeto::DBSchema::Result::Alocaco>

=cut

__PACKAGE__->has_many(
  "alocacoes",
  "Projeto::DBSchema::Result::Alocaco",
  { "foreign.projeto_id" => "self.projeto_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 objetivos

Type: has_many

Related object: L<Projeto::DBSchema::Result::Objetivo>

=cut

__PACKAGE__->has_many(
  "objetivos",
  "Projeto::DBSchema::Result::Objetivo",
  { "foreign.projeto_id" => "self.projeto_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 gerente

Type: belongs_to

Related object: L<Projeto::DBSchema::Result::Pessoa>

=cut

__PACKAGE__->belongs_to(
  "gerente",
  "Projeto::DBSchema::Result::Pessoa",
  { pessoa_id => "gerente_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 coordenacao

Type: belongs_to

Related object: L<Projeto::DBSchema::Result::Coordenaco>

=cut

__PACKAGE__->belongs_to(
  "coordenacao",
  "Projeto::DBSchema::Result::Coordenaco",
  { coordenacao_id => "coordenacao_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 restricoes

Type: has_many

Related object: L<Projeto::DBSchema::Result::Restrico>

=cut

__PACKAGE__->has_many(
  "restricoes",
  "Projeto::DBSchema::Result::Restrico",
  { "foreign.projeto_id" => "self.projeto_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 riscos

Type: has_many

Related object: L<Projeto::DBSchema::Result::Risco>

=cut

__PACKAGE__->has_many(
  "riscos",
  "Projeto::DBSchema::Result::Risco",
  { "foreign.projeto_id" => "self.projeto_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 statuses

Type: has_many

Related object: L<Projeto::DBSchema::Result::Status>

=cut

__PACKAGE__->has_many(
  "statuses",
  "Projeto::DBSchema::Result::Status",
  { "foreign.projeto_id" => "self.projeto_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-22 19:27:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VKj8Q4usBZPpZGvwB4Y+cw


# You can replace this text with custom content, and it will be preserved on regeneration

1;
