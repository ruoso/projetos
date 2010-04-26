package Projeto::View::XMind;
use Moose;
extends 'Catalyst::View';
use XML::Compile::Util 'pack_type';
use XML::Compile::Schema;
use XML::LibXML;
use Archive::Zip;
use Digest::SHA1;
use IO::Handle;
use File::Temp qw(tempfile :seekable);
use File::stat;

has data => (is => 'rw',
             required => 0);

sub ACCEPT_CONTEXT {
    my ($self, $c, $data) = @_;
    die 'need data for XMind.' unless $data;
    return $self->new({ data => $data });
}

my $id = 0;
use constant XMIND_NS => 'urn:xmind:xmap:xmlns:content:2.0';
my $schema = XML::Compile::Schema->new(\*DATA);
my $el = $schema->compile(WRITER => pack_type(XMIND_NS, 'xmap-content'),
                          use_default_namespace => 1);
sub process {
    my ($self, $c) = @_;

    my $xm = $self->translate($self->data);
    my $doc = XML::LibXML::Document->new;
    my $xml = $el->($doc, $xm);
    $doc->setDocumentElement($xml);

    my $zip = Archive::Zip->new();
    $zip->addString('<?xml version="1.0" encoding="UTF-8" standalone="no"?>'.
                    '<meta xmlns="urn:xmind:xmap:xmlns:meta:2.0" version="2.0"/>',
                    'meta.xml');
    $zip->addString($doc->toString, 'content.xml');

    my ($fh, $name) = tempfile();
    $fh->binmode(':raw');
    $fh->autoflush(1);
    $fh->blocking(1);
    $zip->writeToFileHandle($fh);
    $fh->seek(0,0);
    my $sb = stat($name);
    unlink $name;

    $c->res->header('Content-disposition','attachment; filename=file.xmind');
    $c->res->content_type('application/xmind');
    $c->res->content_length($sb->size);

    $c->res->body($fh);
}

sub translate {
    my ($self, $data) = @_;
    # overrided by subclasses
    return $data;
}

sub get_id {
    return lc Digest::SHA1::sha1_base64(++$id);
}


1;

__DATA__
<?xml version="1.0" encoding="UTF-8"?>

<xs:schema
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fo="http://www.w3.org/1999/XSL/Format"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns:xhtml="http://www.w3.org/1999/xhtml"
   xmlns:xlink="http://www.w3.org/1999/xlink"
   xmlns="urn:xmind:xmap:xmlns:content:2.0"
   targetNamespace="urn:xmind:xmap:xmlns:content:2.0"
   elementFormDefault="qualified">

  <xs:element name="xmap-content">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="sheet">
          <xs:complexType>
            <xs:sequence>
              <xs:element maxOccurs="unbounded" name="topic" type="topic" />
              <xs:element name="title" type="xs:string" />
            </xs:sequence>
            <xs:attribute name="id" type="xs:ID" />
          </xs:complexType>
        </xs:element>
      </xs:sequence>
      <xs:attribute name="version" type="xs:string" />
    </xs:complexType>
  </xs:element>

  <xs:complexType name="children">
    <xs:sequence>
      <xs:element name="topics">
        <xs:complexType>
          <xs:sequence>
            <xs:element name="topic" type="topic" maxOccurs="unbounded" />
          </xs:sequence>
          <xs:attribute name="type" type="xs:string" />
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:complexType>

  <xs:complexType name="topic">
    <xs:sequence>
      <xs:element name="title" type="xs:string" />
      <xs:element name="children" minOccurs="0" type="children" />
    </xs:sequence>
    <xs:attribute name="id" type="xs:ID" />
    <xs:attribute name="branch" type="xs:string" />
    <xs:attribute name="structure-class" type="xs:string" />
  </xs:complexType>

</xs:schema>
