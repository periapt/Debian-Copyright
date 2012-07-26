use Test::More tests => 1;
use Test::Deep;

use Debian::Copyright::Format;
my @fields = sort (Debian::Copyright::Format::getFields('Header'));
cmp_deeply(\@fields,
    [
        'Comment',
        'Format_Specification',
        'Maintainer',
        'Name',
        'Source',
        'Upstream_Contact',
        'Upstream_Name',
        'X_Comment',
    ]
);
