# $Id: status.t,v 1.1 2002/08/20 03:25:28 comdog Exp $
use strict;

use Test::HTTPStatus tests => 1;

http_ok( 'http://www.perl.org', HTTP_OK );
