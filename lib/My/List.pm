package My::List;

use 5.012;
use warnings;

use My::List::Cell;
use My::List::Iterator;

sub new {
    my ($class) = @_;
    my $head = My::List::Cell->new();
    bless {
        head => $head,
        tail => $head
    }, $class;
}

sub append {
    my ($self, $value) = @_;
    $self->{tail} = My::List::Cell->new($self->{tail}, $value);
}

sub clear {
    my ($self) = @_;
    $self->{head} = $self->{tail} = My::List::Cell->new();
}

sub iterator {
    my ($self) = @_;
    My::List::Iterator->new($self->{head});
}

1;
