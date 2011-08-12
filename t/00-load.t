#!perl -T

use Test::More tests => 6;

BEGIN {
    use_ok( 'Debian::Copyright' ) || print "Bail out!\n";
    use_ok( 'Debian::Copyright::Stanza' ) || print "Bail out!\n";
    use_ok( 'Debian::Copyright::Stanza::Files' ) || print "Bail out!\n";
    use_ok( 'Debian::Copyright::Stanza::Header' ) || print "Bail out!\n";
    use_ok( 'Debian::Copyright::Stanza::License' ) || print "Bail out!\n";
    use_ok( 'Debian::Copyright::Stanza::OrSeparated' ) || print "Bail out!\n";
}

diag( "Testing Debian::Copyright $Debian::Copyright::VERSION, Perl $], $^X" );
