=head1 NAME

Debian::Copyright::Format - which fields to use

=head1 VERSION

This document describes Debian::Copyright::Format version 0.2 .

=head1 DESCRIPTION

The sole purpose of this module is to hold a data structure, defining
which fields are supported in which versions of the 
L<DEP-5/Format: http://www.debian.org/doc/packaging-manuals/copyright-format/1.0/>
specification.

=end

package Debian::Copyright::Format;

use strict;
use warnings;
use constant {
    SPECIFICATION => {
        'http://www.debian.org/doc/packaging-manuals/copyright-format/1.0/' => {
            Header => [
                'Format-Specification',
                'Upstream-Contact',
                'Upstream-Name',
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
                'Format-Specification',
                'Maintainer',
                'Name',
                'Source',
                'X-Comment',
            ],
            Files => [
                'Files',
                'Copyright',
                'License',
                'X-Comment',
            ],
            License => [
                'License',
                'X-Comment',
            ],
        },
    }
}
use Carp;

our $VERSION = '0.2';

=head1 COPYRIGHT & LICENSE

Copyright (C) 2011-2012 Nicholas Bamber L<nicholas@periapt.co.uk>

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License version 2 as published by the Free
Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

=cut

1;
