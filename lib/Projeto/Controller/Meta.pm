package Projeto::Controller::Meta;
use strict;
use warnings;
use base "Catalyst::Controller";



sub end :Private {
    my ($self, $c) = @_;
    if ($c->res->code == 302) {
        $c->res->redirect($c->uri_for_action('/projeto/view',$c->stash->{item}->objetivo->projeto_id));
    } else {
        $c->forward('/end');
    }
}

1;

