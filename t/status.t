# $Id: status.t 250 2002-08-20 03:25:28Z comdog $
use strict;

use Test::HTTPStatus tests => 1;

http_ok( 'http://www.perl.org', HTTP_OK );
