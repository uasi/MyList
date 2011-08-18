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
        tail => $head,
        size => 0
    }, $class;
}

sub append {
    my ($self, $value) = @_;
    $self->{tail} = My::List::Cell->new($self->{tail}, $value);
    $self->{size}++;
}

sub clear {
    my ($self) = @_;
    $self->{head} = $self->{tail} = My::List::Cell->new();
    $self->{size} = 0;
}

sub size {
    my ($self) = @_;
    $self->{size};
}

sub iterator {
    my ($self) = @_;
    My::List::Iterator->new($self);
}

sub to_array {
    my ($self) = @_;
    my @array;
    my $iter = $self->iterator;
    while ($iter->has_next) {
        push @array, $iter->next->value;
    }
    @array;
}

1;
