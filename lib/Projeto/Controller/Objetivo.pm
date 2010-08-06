package Projeto::Controller::Objetivo;
use Projeto::Form::Objetivo;
use strict;
use warnings;
use base "Catalyst::Controller";

sub end :Private {
    my ($self, $c) = @_;
    if ($c->res->code == 302) {
        $c->res->redirect($c->uri_for_action('/projeto/view',$c->stash->{item}->projeto_id));
    } else {
        $c->forward('/end');
    }
}


1;

