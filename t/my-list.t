#!/usr/bin/env perl

BEGIN { push @INC, 'lib' }

use 5.012;
use warnings;
use Test::Exception;
use Test::More;

use My::List;

lives_ok { My::List->new() }, 'new';

done_testing;
