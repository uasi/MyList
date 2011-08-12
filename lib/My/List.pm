package My::List;

use 5.012;
use warnings;

use My::List::Iterator;

sub new {
    my ($class) = @_;
    my $head = {next => undef};
    bless {
        head => $head,
        tail => $head
    }, $class;
}

sub append {
    my ($self, $value) = @_;
    my $cell = {value => $value, next => undef};
    $self->{tail} = ($self->{tail}->{next} = $cell);
}

sub iterator {
    my ($self) = @_;
    My::List::Iterator->new($self->{head});
}

1;
