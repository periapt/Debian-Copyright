use Test::More tests => 8;
use Debian::Copyright;
use Test::Deep;
use Test::LongString;

my $copyright = Debian::Copyright->new;
isa_ok($copyright, 'Debian::Copyright');
$copyright->read('t/data/mysql');
is($copyright->header->Format, 'http://www.debian.org/doc/packaging-manuals/copyright-format/1.0/', 'Format');
is($copyright->header->Upstream_Name, 'MySQL 5.5', 'Upstream-Name');
is($copyright->header->Upstream_Contact, 'http://bugs.mysql.com/', 'Upstream-Contact');
is($copyright->header->Source, 'http://dev.mysql.com/downloads/mysql/5.5.html', 'Source');
my $s =<<'EOS';
 The file Docs/mysql.info is removed from the upstream source
 because it is incompatible with the Debian Free Software Guidelines.
 See debian/README.source for how this repacking was done.
 .
 Originally produced by a modified version of licensecheck2dep5
 from CDBS by Clint Byrum <clint@ubuntu.com>. Hand modified to reduce 
 redundancy in the output and add appropriate license text.
 .
 Also, MySQL carries the "FOSS License Exception" specified in README
 .
 Quoting from README:
 .
 MySQL FOSS License Exception We want free and open source
 software applications under certain licenses to be able to use
 specified GPL-licensed MySQL client libraries despite the fact
 that not all such FOSS licenses are compatible with version
 2 of the GNU General Public License.  Therefore there are
 special exceptions to the terms and conditions of the GPLv2
 as applied to these client libraries, which are identified
 and described in more detail in the FOSS License Exception at
 <http://www.mysql.com/about/legal/licensing/foss-exception.html>.
 .
 The text of the Above URL is quoted below, as of Aug 17, 2011.
 .
 > FOSS License Exception
 > .
 > Updated July 1, 2010
 > .
 > What is the FOSS License Exception?  Oracle's Free and Open Source
 > Software ("FOSS") License Exception (formerly known as the FLOSS
 > License Exception) allows developers of FOSS applications to include
 > Oracle's MySQL Client Libraries (also referred to as "MySQL Drivers"
 > or "MySQL Connectors") with their FOSS applications. MySQL Client
 > Libraries are typically licensed pursuant to version 2 of the General
 > Public License ("GPL"), but this exception permits distribution of
 > certain MySQL Client Libraries with a developer's FOSS applications
 > licensed under the terms of another FOSS license listed below,
 > even though such other FOSS license may be incompatible with the GPL.
 > .
 > The following terms and conditions describe the circumstances under
 > which Oracle's FOSS License Exception applies.
 > .
 > Oracle's FOSS License Exception Terms and Conditions Definitions.
 > "Derivative Work" means a derivative work, as defined under applicable
 > copyright law, formed entirely from the Program and one or more
 > FOSS Applications.
 > .
 > "FOSS Application" means a free and open source software application
 > distributed subject to a license listed in the section below titled
 > "FOSS License List."
 > .
 > "FOSS Notice" means a notice placed by Oracle or MySQL in a copy
 > of the MySQL Client Libraries stating that such copy of the MySQL
 > Client Libraries may be distributed under Oracle's or MySQL's FOSS
 > (or FLOSS) License Exception.
 > .
 > "Independent Work" means portions of the Derivative Work that are not
 > derived from the Program and can reasonably be considered independent
 > and separate works.
 > .
 > "Program" means a copy of Oracle's MySQL Client Libraries that
 > contains a FOSS Notice.
 > . 
 > A FOSS application developer ("you" or "your") may distribute a
 > Derivative Work provided that you and the Derivative Work meet all
 > of the following conditions: You obey the GPL in all respects for
 > the Program and all portions (including modifications) of the Program
 > included in the Derivative Work (provided that this condition does not
 > apply to Independent Works); The Derivative Work does not include any
 > work licensed under the GPL other than the Program; You distribute
 > Independent Works subject to a license listed in the section below
 > titled "FOSS License List"; You distribute Independent Works in
 > object code or executable form with the complete corresponding
 > machine-readable source code on the same medium and under the same
 > FOSS license applying to the object code or executable forms; All
 > works that are aggregated with the Program or the Derivative Work
 > on a medium or volume of storage are not derivative works of the
 > Program, Derivative Work or FOSS Application, and must reasonably
 > be considered independent and separate works.  Oracle reserves all
 > rights not expressly granted in these terms and conditions. If all
 > of the above conditions are not met, then this FOSS License Exception
 > does not apply to you or your Derivative Work.
 > .
 > FOSS License List
 > . 
 > License Name    Version(s)/Copyright Date
 > Release Early    Certified Software
 > Academic Free License    2.0
 > Apache Software License  1.0/1.1/2.0
 > Apple Public Source License  2.0
 > Artistic license     From Perl 5.8.0
 > BSD license  "July 22 1999"
 > Common Development and Distribution License (CDDL)   1.0
 > Common Public License    1.0
 > Eclipse Public License   1.0
 > European Union Public License (EUPL)[1]    1.1
 > GNU Library or "Lesser" General Public License (LGPL)    2.0/2.1/3.0
 > GNU General Public License (GPL)     3.0
 > IBM Public License   1.0
 > Jabber Open Source License   1.0
 > MIT License (As listed in file MIT-License.txt)  -
 > Mozilla Public License (MPL)     1.0/1.1
 > Open Software License    2.0
 > OpenSSL license (with original SSLeay license)   "2003" ("1998")
 > PHP License  3.0/3.01
 > Python license (CNRI Python License)     -
 > Python Software Foundation License   2.1.1
 > Sleepycat License   "1999"
 > University of Illinois/NCSA Open Source License  -
 > W3C License  "2001"
 > X11 License  "2001"
 > Zlib/libpng License  -
 > Zope Public License  2.0
 > [1] When an Independent Work is licensed under a "Compatible License"
 > pursuant to the EUPL, the Compatible License rather than the EUPL is
 > the applicable license for purposes of these FOSS License Exception
 > Terms and Conditions.
 .
 The above text is subject to this copyright notice:
 © 2010, Oracle and/or its affiliates.
EOS
chomp $s;
is_string($copyright->header->Comment, "\n$s", 'Comment');

cmp_deeply($copyright->files->Length, 42, 'no of files');
cmp_deeply($copyright->licenses->Length, 4, 'no of licenses');

