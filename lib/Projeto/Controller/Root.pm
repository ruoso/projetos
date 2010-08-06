package Projeto::Controller::Root;
use strict;
use warnings;
use base 'Catalyst::Controller';

__PACKAGE__->config->{namespace} = '';

sub base :Chained(/) :PathPart('') :CaptureArgs(0) {
}

sub default :Chained(base) :PathPart('') :Args {
    my ( $self, $c ) = @_;
    $c->response->status(404);
    $c->response->body("404 Not Found");
};

sub xmind :Chained(base) :Args(0) {
    my ($self, $c) = @_;
    my $coords = $c->model('DBICSchemamodel::Coordenaco')->search;
    #$c->forward($c->view('XMind::Geral', $coords));
    $c->view('XMind::Geral', $coords)->process($c);
}

sub index :Chained(base) :PathPart('') :Args(0) {
    my ( $self, $c ) = @_;
    my @additional_paths = ( $c->config->{root} );
    $c->stash->{additional_template_paths} = \@additional_paths;
    $c->stash->{template} = 'home.tt';
}

sub end : ActionClass('RenderView') {}

1;
