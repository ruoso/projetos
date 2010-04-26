package Projeto::View::XMind;
use Moose;
extends 'Catalyst::View';
use XML::Compile::Util 'pack_type';
use XML::Compile::Schema;
use XML::LibXML;
use Archive::Zip qw( :ERROR_CODES :CONSTANTS );
use Digest::SHA1;
use IO::Handle;
use File::Temp qw(tempfile :seekable);
use Carp 'confess';

has data => (is => 'rw',
             required => 0);

sub ACCEPT_CONTEXT {
    my ($self, $c, $data) = @_;
    confess 'need data for XMind.' unless $data;
    return $self->new({ data => $data });
}

my $id = 0;
use constant XMIND_NS => 'urn:xmind:xmap:xmlns:content:2.0';
my $schema = XML::Compile::Schema->new(Projeto->path_to('schemas/xmind.xsd'));
my $el = $schema->compile(WRITER => pack_type(XMIND_NS, 'xmap-content'),
                          use_default_namespace => 1);

sub process {
    my ($self, $c) = @_;

    my $xm = $self->translate($self->data);
    my $doc = XML::LibXML::Document->new;
    my $xml = $el->($doc, $xm);
    $doc->setDocumentElement($xml);

    my ($fh, $name) = tempfile();

    my $zip = Archive::Zip->new();
    $zip->addString('<?xml version="1.0" encoding="UTF-8" standalone="no"?>'.
                    '<meta xmlns="urn:xmind:xmap:xmlns:meta:2.0" version="2.0"/>',
                    'meta.xml');
    $zip->addString($doc->toString, 'content.xml');

    $c->res->header('Content-disposition','attachment; filename=file.xmind');
    $c->res->content_type('application/xmind');

    $zip->writeToFileHandle($fh);
    $fh->seek(0, 0);
    $c->res->body($fh);
}

sub translate {
    my ($self, $data) = @_;
    return $data;
}

sub get_id {
    return lc Digest::SHA1::sha1_base64(++$id);
}


1;
