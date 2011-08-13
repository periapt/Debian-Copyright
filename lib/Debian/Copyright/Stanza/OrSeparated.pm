package Debian::Copyright::Stanza::OrSeparated;

our $VERSION = '0.1';

=head1 NAME

Debian::Copyright::Stanza::OrSeparated - 'or' separated field abstraction

=head1 VERSION

This document describes Debian::Copyright::Stanza::OrSeparated version 0.1 .

=cut

use strict;
use warnings;

use Array::Unique;
use Text::ParseWords qw(quotewords);

use overload
    '""' => \&as_string,
    'eq' => \&equals;

=head1 SYNOPSYS

    my $f = Debian::Copyright::Stanza::OrSeparated->new('Artistic');
    $f->add('GPL-1+ or BSD');
    print $f->as_string;
        # 'Artistic or GPL-1+ or BSD'
    print "$f";     # the same
    $f->sort;

=head1 DESCRIPTION

Debian::Copyright::Stanza::OrSeparated abstracts handling of the License
fields in Files blocks, which are lists separated by 'or'.

=head1 CONSTRUCTOR

=head2 new (initial values)

The initial values list is parsed and may contain strings that are in fact
'or'-separated lists. These are split appropriately using L<Text::ParseWords>'
I<quotewords> routine.

=cut

sub new {
    my $self = bless [], shift;

    tie @$self, 'Array::Unique';

    $self->add(@_) if @_;

    $self;
}

=head1 METHODS

=head2 as_string

Returns text representation of the list. A simple join of the elements by
C< or >. The same function is used for overloading the stringification
operation.

=cut

sub as_string
{
    return join( ' or ', @{ $_[0] } );
}

=head2 equals

Natural implementation of the equality function.

=cut

sub equals 
{
    my @args = map { ref $_ ? $_->as_string : $_ } @_;
    return $args[0] eq $args[1];
}

sub _parse {
    my $self = shift;

    my @output;

    for (@_) {
        my @items = quotewords( qr/\s+or\s+/, 1, $_ );
        push @output, @items;
    }

    return @output;
}

=head2 add I<@items>

Adds the given items to the list. Items that are already present are not added,
keeping the list unique.

=cut

sub add {
    my ( $self, @items) = @_;

    push @$self, $self->_parse(@items);
}

=head2 sort

A handy method for sorting the list.

=cut

sub sort {
    my $self = shift;

    @$self = sort @$self;
}


1;
