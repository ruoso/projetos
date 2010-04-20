package Projetos::Schema::Result::Pessoa;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Projetos::Schema::Result::Pessoa

=cut

__PACKAGE__->table("pessoas");

=head1 ACCESSORS

=head2 pessoa_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'pessoas_pessoa_id_seq'

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

=head2 cargo_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 salario

  data_type: 'numeric'
  is_nullable: 1
  size: [10,2]

=head2 custo

  data_type: 'numeric'
  is_nullable: 1
  size: [10,2]

=head2 tipo_contratacao

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "pessoa_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "pessoas_pessoa_id_seq",
  },
  "data_inicio",
  { data_type => "timestamp without time zone", is_nullable => 0 },
  "data_fim",
  { data_type => "timestamp without time zone", is_nullable => 0 },
  "nome",
  { data_type => "character varying", is_nullable => 0, size => 100 },
  "cargo_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "salario",
  { data_type => "numeric", is_nullable => 1, size => [10, 2] },
  "custo",
  { data_type => "numeric", is_nullable => 1, size => [10, 2] },
  "tipo_contratacao",
  { data_type => "character varying", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("pessoa_id");

=head1 RELATIONS

=head2 alocacoes

Type: has_many

Related object: L<Projetos::Schema::Result::Alocaco>

=cut

__PACKAGE__->has_many(
  "alocacoes",
  "Projetos::Schema::Result::Alocaco",
  { "foreign.pessoa_id" => "self.pessoa_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cargo

Type: belongs_to

Related object: L<Projetos::Schema::Result::Cargo>

=cut

__PACKAGE__->belongs_to(
  "cargo",
  "Projetos::Schema::Result::Cargo",
  { cargo_id => "cargo_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 projetos

Type: has_many

Related object: L<Projetos::Schema::Result::Projeto>

=cut

__PACKAGE__->has_many(
  "projetos",
  "Projetos::Schema::Result::Projeto",
  { "foreign.gerente_id" => "self.pessoa_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-20 19:36:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4b7qOJkIGBdPy0qhGR4+Mg

sub display_name {
    my $self = shift;
    $self->nome || '';
}

# You can replace this text with custom content, and it will be preserved on regeneration
1;
