package Projeto::View::XMind;
use warnings;
use strict;
use base 'Catalyst::View';
use XML::Compile::Util 'pack_type';
use XML::Compile::Schema;
use XML::LibXML;

use constant XMIND_NS => 'urn:xmind:xmap:xmlns:content:2.0';
my $schema = XML::Compile::Schema->new(Projeto->path_to('schemas/xmind.xsd'));
my $el = $schema->compile(WRITER => pack_type XMIND_NS, 'xmap-content');

sub process {
    my ($self, $c, $data) = @_;

    my $xm = $self->translate($data);
    my $doc = XML::LibXML::Document->new;
    my $xml = $el->($doc, $xm);

    $c->res->content_type('text/xml');
    $c->res->body($xml->toString);
}

sub translate {
    die 'Should be overrided by subclass';
}

1;
