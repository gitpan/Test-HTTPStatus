# $Id: load.t,v 1.2 2004/09/08 01:11:12 comdog Exp $
BEGIN {
	@classes = qw(Test::HTTPStatus);
	}

use Test::More tests => scalar @classes;

foreach my $class ( @classes )
	{
	print "bail out! Could not compile $class!" unless use_ok( $class );
	}
