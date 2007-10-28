# $Id: pod_coverage.t 1577 2005-03-08 22:59:47Z comdog $

use Test::More;
eval "use Test::Pod::Coverage";

if( $@ )
	{
	plan skip_all => "Test::Pod::Coverage required for testing POD";
	}
else
	{
	plan tests => 1;

	pod_coverage_ok( "Test::HTTPStatus" );      
	}
