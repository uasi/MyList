package test::My::List;

use 5.012;
use warnings;
use parent 'Test::Class';
use Test::More;

use My::List;

sub init : Tests {
    new_ok 'My::List';
}

sub iterate : Tests {
    my ($list, $iter);

    $list = My::List->new;
    $iter = $list->iterator;
    ok !$iter->has_next, 'empty list';

    $list = My::List->new;
    $list->append(1);
    $list->append(2);
    $list->append(3);
    $iter = $list->iterator;

    my $i = 1;
    while ($iter->has_next) {
        is $iter->next->value, $i, 'iterator';
        $i++;
    }

    $list->clear;
    $iter = $list->iterator;
    ok !$iter->has_next, 'clear';
}

__PACKAGE__->runtests;

1;
