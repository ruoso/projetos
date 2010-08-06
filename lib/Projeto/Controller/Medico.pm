package Projeto::Controller::Medico;
use base "Catalyst::Controller";
use strict;
use warnings;

sub end :Private {
    my ($self, $c) = @_;
    if ($c->res->code == 302) {
        $c->res->redirect($c->uri_for_action('/projeto/view',$c->stash->{item}->meta->objetivo->projeto_id));
    } else {
        $c->forward('/end');
    }
}


1;

