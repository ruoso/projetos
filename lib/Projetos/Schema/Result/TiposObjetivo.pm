package Projetos::Schema::Result::TiposObjetivo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Projetos::Schema::Result::TiposObjetivo

=cut

__PACKAGE__->table("tipos_objetivo");

=head1 ACCESSORS

=head2 tipo_objetivo_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'tipos_objetivo_tipo_objetivo_id_seq'

=head2 nome

  data_type: 'character varying'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "tipo_objetivo_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "tipos_objetivo_tipo_objetivo_id_seq",
  },
  "nome",
  { data_type => "character varying", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("tipo_objetivo_id");

=head1 RELATIONS

=head2 objetivos

Type: has_many

Related object: L<Projetos::Schema::Result::Objetivo>

=cut

__PACKAGE__->has_many(
  "objetivos",
  "Projetos::Schema::Result::Objetivo",
  { "foreign.tipo_objetivo_id" => "self.tipo_objetivo_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-20 19:36:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sK2aqmDD/hLjHi5MEkV7Eg

sub display_name {
    my $self = shift;
    $self->nome || '';
}

# You can replace this text with custom content, and it will be preserved on regeneration
1;
