package Projeto::DBSchema::Result::Servico;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Projeto::DBSchema::Result::Servico

=cut

__PACKAGE__->table("servicos");

=head1 ACCESSORS

=head2 servico_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'servicos_servico_id_seq'

=head2 data_inicio

  data_type: 'date'
  is_nullable: 1

=head2 data_fim

  data_type: 'date'
  is_nullable: 1

=head2 nome

  data_type: 'character varying'
  is_nullable: 0

=head2 coordenacao_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "servico_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "servicos_servico_id_seq",
  },
  "data_inicio",
  { data_type => "date", is_nullable => 1 },
  "data_fim",
  { data_type => "date", is_nullable => 1 },
  "nome",
  { data_type => "character varying", is_nullable => 0 },
  "coordenacao_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("servico_id");

=head1 RELATIONS

=head2 alocacoes

Type: has_many

Related object: L<Projeto::DBSchema::Result::Alocaco>

=cut

__PACKAGE__->has_many(
  "alocacoes",
  "Projeto::DBSchema::Result::Alocaco",
  { "foreign.servico_id" => "self.servico_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 objetivos

Type: has_many

Related object: L<Projeto::DBSchema::Result::Objetivo>

=cut

__PACKAGE__->has_many(
  "objetivos",
  "Projeto::DBSchema::Result::Objetivo",
  { "foreign.servico_id" => "self.servico_id" },
  { cascade_copy => 0, cascade_delete => 0 },
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


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-27 16:43:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WZpC1RBZBR+LzMGlj0hMDg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
