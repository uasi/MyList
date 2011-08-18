package My::List::Cell;

use 5.012;
use warnings;

sub new {
    my ($class, $prev, $value) = @_;
    my $self = {
        next => undef,
        prev => $prev, 
        value => $value
    };
    $prev->{next} = $self;
    bless $self, $class;
}

sub value {
    my ($self) = @_;
    $self->{value};
}

sub set_value {
    my ($self, $value) = @_;
    $self->{value} = $value;
}

1;
