use strict;
use warnings;

package Projeto;

use Catalyst::Runtime '5.70';


use Catalyst qw/
	-Debug
        Unicode::Encoding
	ConfigLoader
        I18N
	Static::Simple
/;
#	Session
#	Session::Store::FastMmap
#	Session::State::Cookie
#	Authentication
#	Authentication::Store::DBIC
#	Authentication::Credential::Password
#	Auth::Utils

our $VERSION = '0.01';

__PACKAGE__->config( name => 'Projeto' );


# Start the application
__PACKAGE__->setup;

#
# IMPORTANT: Please look into Projeto::Controller::Root for more
#

=head1 NAME

Projeto - Catalyst based application

=head1 SYNOPSIS

    script/projeto_server.pl

=head1 DESCRIPTION

Catalyst based application.

=head1 SEE ALSO

L<Projeto::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Daniel Ruoso,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
