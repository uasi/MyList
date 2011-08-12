package My::List::Iterator;

use 5.012;
use warnings;
use Carp;

sub new {
    my ($class, $cell) = @_;
    bless {cell => $cell}, $class;
}

sub has_next {
    my ($self) = @_;
    defined $self->{cell}->{next};
}

sub next {
    my ($self) = @_;
    $self->{cell} = $self->{cell}->{next};
    $self;
}

sub value {
    my ($self) = @_;
    unless (exists $self->{cell}->{value}) {
        croak "Illegal use of value()";
    }
    $self->{cell}->{value};
}

1;
