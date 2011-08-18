package test::My::List;

use 5.012;
use warnings;
use parent 'Test::Class';
use Test::More;

use My::List;

my @LIST_ITEMS = (0, 42, 'foo');

sub make_list {
    my $list = My::List->new;
    $list->append($_) for @LIST_ITEMS;
    $list;
}

sub init : Tests {
    new_ok 'My::List';
}

sub append : Tests {
    ok make_list(), 'append';
}

sub clear : Tests {
    my ($list, $iter);

    $list = make_list;
    is $list->size, (scalar @LIST_ITEMS), 'clear';

    $list->clear;
    $iter = $list->iterator;
    ok !$iter->has_next, 'clear';
    is $list->size, 0, 'clear';
}

sub iterator : Tests {
    my ($list, $iter, @list_items);

    $list = My::List->new;
    $iter = $list->iterator;
    ok $iter, 'iterator (empty list)';
    ok !$iter->has_next, 'iterator (empty list)';

    $list = make_list;
    $iter = $list->iterator;
    @list_items = @LIST_ITEMS;
    while ($iter->has_next) {
        my $item = shift @list_items;
        is $iter->next->value, $item, 'iterator';
    }
}

sub remove : Tests {
    my ($list, $iter, @list_items);

    $list = make_list;
    $iter = $list->iterator;
    ok !(eval { $iter->remove }), 'remove';

    $list = make_list;
    $iter = $list->iterator;
    $iter->next;
    $iter->remove;
    @list_items = @LIST_ITEMS;
    shift @list_items;
    while ($iter->has_next) {
        my $item = shift @list_items;
        is $iter->next->value, $item, 'remove';
    }
}

sub size : Tests {
    my ($list, $iter);

    $list = My::List->new;
    is $list->size, 0, 'size';

    $list = make_list;
    is $list->size, (scalar @LIST_ITEMS), 'size';

    $list = make_list;
    $iter = $list->iterator;
    $iter->next;
    $iter->remove;
    is $list->size, (scalar @LIST_ITEMS) - 1, 'size';
}

sub to_array : Tests {
    my $list = My::List->new;
    is_deeply [$list->to_array], [];

    $list = make_list;
    is_deeply [$list->to_array], \@LIST_ITEMS, 'to_array';
}

__PACKAGE__->runtests;

1;
