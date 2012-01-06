use strictures 1;
package MooX::Types::MooseLike::MaybeTest;
use Moo;
use MooX::Types::MooseLike::Maybe qw(MaybeStr MaybeInt);

use Test::More;
use Test::Fatal;

plan tests => 6;

has 'maybe_int' => (
    is => 'ro',
    isa => MaybeInt,
);

has 'maybe_str' => (
    is => 'ro',
    isa => MaybeStr,
);

ok(MooX::Types::MooseLike::MaybeTest->new(maybe_int => undef), 'MaybeInt Undef');
ok(MooX::Types::MooseLike::MaybeTest->new(maybe_int => 42), 'MaybeInt Int');
like(
   exception { MooX::Types::MooseLike::MaybeTest->new(maybe_int => 'foobar') }, 
   qr/is not/,
   'MaybeInt with a Str fails'
);

ok(MooX::Types::MooseLike::MaybeTest->new(maybe_str => undef), 'MaybeStr Undef');
ok(MooX::Types::MooseLike::MaybeTest->new(maybe_str => 'foobar'), 'MaybeStr Str');
like(
    exception { MooX::Types::MooseLike::MaybeTest->new(maybe_str => []) },
    qr/is not/,
    'MaybeStr with an ArrayRef fails'
);
