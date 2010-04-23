package Projeto::DBSchema::Result::Desembolso;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Projeto::DBSchema::Result::Desembolso

=cut

__PACKAGE__->table("desembolsos");

=head1 ACCESSORS

=head2 desembolso_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'desembolsos_desembolso_id_seq'

=head2 projeto_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 data_prevista

  data_type: 'date'
  is_nullable: 0

=head2 valor

  data_type: 'numeric'
  is_nullable: 1
  size: [10,2]

=head2 data_empenho

  data_type: 'date'
  is_nullable: 1

=head2 empenho

  data_type: 'character varying'
  is_nullable: 1

=head2 data_nad

  data_type: 'date'
  is_nullable: 1

=head2 nad

  data_type: 'character varying'
  is_nullable: 1

=head2 data_liquidacao

  data_type: 'date'
  is_nullable: 1

=head2 liquidacao

  data_type: 'character varying'
  is_nullable: 1

=head2 data_pagamento

  data_type: 'date'
  is_nullable: 1

=head2 pagamento

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "desembolso_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "desembolsos_desembolso_id_seq",
  },
  "projeto_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "data_prevista",
  { data_type => "date", is_nullable => 0 },
  "valor",
  { data_type => "numeric", is_nullable => 1, size => [10, 2] },
  "data_empenho",
  { data_type => "date", is_nullable => 1 },
  "empenho",
  { data_type => "character varying", is_nullable => 1 },
  "data_nad",
  { data_type => "date", is_nullable => 1 },
  "nad",
  { data_type => "character varying", is_nullable => 1 },
  "data_liquidacao",
  { data_type => "date", is_nullable => 1 },
  "liquidacao",
  { data_type => "character varying", is_nullable => 1 },
  "data_pagamento",
  { data_type => "date", is_nullable => 1 },
  "pagamento",
  { data_type => "character varying", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("desembolso_id");

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


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-23 11:08:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Kh2m2gFhHnk26LkyLOuFhA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
