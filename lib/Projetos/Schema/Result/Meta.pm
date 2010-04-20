package Projetos::Schema::Result::Meta;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Projetos::Schema::Result::Meta

=cut

__PACKAGE__->table("metas");

=head1 ACCESSORS

=head2 meta_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'metas_meta_id_seq'

=head2 data_inicio

  data_type: 'timestamp without time zone'
  is_nullable: 0

=head2 data_fim

  data_type: 'timestamp without time zone'
  is_nullable: 0

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
  { data_type => "timestamp without time zone", is_nullable => 0 },
  "data_fim",
  { data_type => "timestamp without time zone", is_nullable => 0 },
  "objetivo_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "descricao",
  { data_type => "character varying", is_nullable => 0, size => 200 },
);
__PACKAGE__->set_primary_key("meta_id");

=head1 RELATIONS

=head2 medicoes

Type: has_many

Related object: L<Projetos::Schema::Result::Medico>

=cut

__PACKAGE__->has_many(
  "medicoes",
  "Projetos::Schema::Result::Medico",
  { "foreign.meta_id" => "self.meta_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 objetivo

Type: belongs_to

Related object: L<Projetos::Schema::Result::Objetivo>

=cut

__PACKAGE__->belongs_to(
  "objetivo",
  "Projetos::Schema::Result::Objetivo",
  { objetivo_id => "objetivo_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-20 19:36:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:F8BYRWoR2tviEDrDZrV6BQ

sub display_name {
    my $self = shift;
    $self->descricao || '';
}

# You can replace this text with custom content, and it will be preserved on regeneration
1;
