# $Id: load.t 1440 2004-09-08 01:11:12Z comdog $
BEGIN {
	@classes = qw(Test::HTTPStatus);
	}

use Test::More tests => scalar @classes;

foreach my $class ( @classes )
	{
	print "bail out! Could not compile $class!" unless use_ok( $class );
	}
