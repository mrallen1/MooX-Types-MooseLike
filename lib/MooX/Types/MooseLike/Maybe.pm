use strictures 1;

package MooX::Types::MooseLike::Maybe;
use MooX::Types::MooseLike::Base;
use parent qw(Exporter);
our @EXPORT_OK = ();

my $type_definitions = [ 
    {
        name => 'MaybeInt',
        subtype_of => 'Int',
        from => 'MooX::Types::MooseLike::Base',
        test_join => 'or',
        test => sub { !defined($_[0]) },
        message => sub { "$_[0] is not an Int or undef" },
    },
    {
        name => 'MaybeStr',
        subtype_of => 'Str',
        from => 'MooX::Types::MooseLike::Base',
        test_join => 'or',
        test => sub { !defined($_[0]) },
        message => sub { "$_[0] is not a Str or undef" },
    },
];

MooX::Types::MooseLike::register_types($type_definitions, __PACKAGE__);

1;
