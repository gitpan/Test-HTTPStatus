# $Id: get_status.t,v 1.1 2002/08/20 03:25:28 comdog Exp $
use strict;

use Test::More tests => 4;

BEGIN { require Test::HTTPStatus; Test::HTTPStatus->import };

use HTTP::SimpleLinkChecker;

SKIP: {
	skip "Not connected to network!", 2
		unless HTTP::SimpleLinkChecker::check_link(
			'http://www.yahoo.com') eq 200;
			
	my $status = Test::HTTPStatus::_get_status('http://www.perl.org');
	ok( $status->{status} eq HTTP_OK, "HTTP OK" );
	
	   $status = Test::HTTPStatus::_get_status('http://www.perl.com/xyz.abc');
	ok( $status->{status} eq HTTP_NOT_FOUND, "HTTP Not Found" );
	
	};

	my $status = Test::HTTPStatus::_get_status();
	ok( $status->{status} eq NO_URL, "No URL" );

	   $status = Test::HTTPStatus::_get_status('foo');
	ok( $status->{status} eq 400, "HTTP Server Error" );
