#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use 5.030;

is capture("perl perl/ch-1.pl 20"), <<END;
3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678926
END

# build list of words for testing
ok 0==system("aspell -d en dump master | aspell -l en expand > words.txt");

is capture("perl perl/ch-2.pl words.txt world"), <<END;
w
o
or
ow
owl
old
l
lo
low
lord
r
row
rd
rod
d
do
wold
world
word
END


done_testing;

sub capture {
	my($cmd) = @_;
	my $out = `$cmd`;
	$out =~ s/[ \t\v\f\r]*\n/\n/g;
	return $out;
}
