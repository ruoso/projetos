package Projetos::Schema::Result::Papei;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Projetos::Schema::Result::Papei

=cut

__PACKAGE__->table("papeis");

=head1 ACCESSORS

=head2 papel_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'papeis_papel_id_seq'

=head2 data_inicio

  data_type: 'timestamp without time zone'
  is_nullable: 0

=head2 data_fim

  data_type: 'timestamp without time zone'
  is_nullable: 0

=head2 descricao

  data_type: 'character varying'
  is_nullable: 0
  size: 100

=cut

__PACKAGE__->add_columns(
  "papel_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "papeis_papel_id_seq",
  },
  "data_inicio",
  { data_type => "timestamp without time zone", is_nullable => 0 },
  "data_fim",
  { data_type => "timestamp without time zone", is_nullable => 0 },
  "descricao",
  { data_type => "character varying", is_nullable => 0, size => 100 },
);
__PACKAGE__->set_primary_key("papel_id");

=head1 RELATIONS

=head2 alocacoes

Type: has_many

Related object: L<Projetos::Schema::Result::Alocaco>

=cut

__PACKAGE__->has_many(
  "alocacoes",
  "Projetos::Schema::Result::Alocaco",
  { "foreign.papel_id" => "self.papel_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-04-20 19:36:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:V19o0yQFr7TO+08EtSZQHQ

sub display_name {
    my $self = shift;
    $self->descricao || '';
}

# You can replace this text with custom content, and it will be preserved on regeneration
1;
