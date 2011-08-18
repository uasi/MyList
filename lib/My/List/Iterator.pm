package My::List::Iterator;

use 5.012;
use warnings;
use Carp;

sub new {
    my ($class, $list) = @_;
    bless {
        list => $list,
        cell => $list->{head}
    }, $class;
}

sub has_next {
    my ($self) = @_;
    defined $self->{cell}->{next};
}

sub next {
    my ($self) = @_;
    $self->{cell} = $self->{cell}->{next};
    $self->{cell};
}

sub remove {
    my ($self) = @_;
    unless (defined $self->{cell}->{prev}) {
        croak "Head cannot be removed";
    }
    $self->{cell}->{prev} = $self->{cell}->{next};
    $self->{list}->{size}--;
}

1;
