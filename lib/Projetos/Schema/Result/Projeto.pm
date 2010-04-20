package Projetos::Schema::Result::Projeto;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Projetos::Schema::Result::Projeto

=cut

__PACKAGE__->table("projetos");

=head1 ACCESSORS

=head2 projeto_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'projetos_projeto_id_seq'

=head2 data_inicio

  data_type: 'timestamp without time zone'
  is_nullable: 0

=head2 data_fim

  data_type: 'timestamp without time zone'
  is_nullable: 0

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

=head2 status

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
  { data_type => "timestamp without time zone", is_nullable => 0 },
  "data_fim",
  { data_type => "timestamp without time zone", is_nullable => 0 },
  "nome",
  { data_type => "character varying", is_nullable => 0, size => 100 },
  "gerente_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "coordenacao_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "valor",
  { data_type => "numeric", is_nullable => 1, size => [10, 2] },
  "status",
  { data_type => "numeric", is_nullable => 1, size => [10, 2] },
);
__PACKAGE__->set_primary_key("projeto_id");

=head1 RELATIONS

=head2 alocacoes

Type: has_many

Related object: L<Projetos::Schema::Result::Alocaco>

=cut

__PACKAGE__->has_many(
  "alocacoes",
  "Projetos::Schema::Result::Alocaco",
  { "foreign.projeto_id" => "self.projeto_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 objetivos

Type: has_many

Related object: L<Projetos::Schema::Result::Objetivo>

=cut

__PACKAGE__->has_many(
  "objetivos",
  "Projetos::Schema::Result::Objetivo",
  { "foreign.projeto_id" => "self.projeto_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 gerente

Type: belongs_to

Related object: L<Projetos::Schema::Result::Pessoa>

=cut

__PACKAGE__->belongs_to(
  "gerente",
  "Projetos::Schema::Result::Pessoa",
  { pessoa_id => "gerente_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 coordenacao

Type: belongs_to

Related object: L<Projetos::Schema::Result::Coordenaco>

=cut

__PACKAGE__->belongs_to(
  "coordenacao",
  "Projetos::Schema::Result::Coordenaco",
  { coordenacao_id => "coordenacao_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 restricoes

Type: has_many

Related object: L<Projetos::Schema::Result::Restrico>

=cut

__PACKAGE__->has_many(
  "restricoes",
  "Projetos::Schema::Result::Restrico",
  { "foreign.projeto_id" => "self.projeto_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 riscos

Type: has_many

Related object: L<Projetos::Schema::Result::Risco>

=cut

__PACKAGE__->has_many(
  "riscos",
  "Projetos::Schema::Result::Risco",
  { "foreign.projeto_id" => "self.projeto_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-20 19:36:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AP/+VRDsUHFx+yg5E2uZIw

sub display_name {
    my $self = shift;
    $self->nome || '';
}


# You can replace this text with custom content, and it will be preserved on regeneration
1;
