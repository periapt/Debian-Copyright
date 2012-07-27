=head1 NAME

Debian::Copyright::Format - which fields to use

=head1 VERSION

This document describes Debian::Copyright::Format version 0.2 .

=head1 DESCRIPTION

The sole purpose of this module is to hold a data structure, defining
which fields are supported in which versions of the 
L<DEP-5/Format: http://www.debian.org/doc/packaging-manuals/copyright-format/1.0/>
specification.

=cut

package Debian::Copyright::Format;

use strict;
use warnings;
use base qw(Exporter);
our @EXPORT = qw(SPECIFICATION); 
use constant {
    SPECIFICATION => {
        'http://www.debian.org/doc/packaging-manuals/copyright-format/1.0/' => {
            Header => [
                'Format_Specification',
                'Upstream_Contact',
                'Upstream_Name',
                'Source',
                'Comment',
            ],
            Files => [
                'Files',
                'Copyright',
                'License',
                'Comment',
            ],
            License => [
                'License',
                'Comment',
            ],
        },
        'http://svn.debian.org/wsvn/dep/web/deps/dep5.mdwn?op=file&rev=135' => {
            Header => [
                'Format_Specification',
                'Maintainer',
                'Source',
                'Name',
                'X_Comment',
            ],
            Files => [
                'Files',
                'Copyright',
                'License',
                'X_Comment',
            ],
            License => [
                'License',
                'X_Comment',
            ],
        },
    }
};

our $VERSION = '0.2';

#sub getFields {
#    my $type = shift;
#    my %fields = ();
#    foreach my $spec (keys %{SPECIFICATION()}) {
#        %fields = (%fields, map {$_=>1} @{SPECIFICATION()->{$spec}->{$type}});
#    }
#    return keys %fields;
#}

1;
