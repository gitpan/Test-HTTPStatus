#$Id: HTTPStatus.pm,v 1.1 2002/08/20 03:25:28 comdog Exp $
package Test::HTTPStatus;
use strict;

=head1 NAME

Test::HTTPStatus - check an HTTP status

=head1 SYNOPSIS

use Test::HTTPStatus tests => 2;
use Apache::Constants qw(:http);

http_ok( 'http://www.perl.org', HTTP_OK );

http_ok( $url, $status );

=head1 DESCRIPTION

THIS IS ALPHA SOFTWARE.

Check the HTTP status for a resource.

=cut

use 5.004;
use vars qw($VERSION);
$VERSION = '0.50';

use Carp qw(carp);
use HTTP::SimpleLinkChecker;
use Test::Builder;
use URI;

my $Test = Test::Builder->new;
	
use constant NO_URL             => -1;
use constant INVALID_URL        => -2;
use constant HTTP_OK            => 200;
use constant HTTP_NOT_FOUND     => 404;

sub import 
	{
    my $self = shift;
    my $caller = caller;
    no strict 'refs';
    *{$caller.'::http_ok'}         = \&http_ok;
    *{$caller.'::NO_URL'}          = \&NO_URL;
    *{$caller.'::INVALID_URL'}     = \&INVALID_URL;
    *{$caller.'::HTTP_OK'}         = \&HTTP_OK;
    *{$caller.'::HTTP_NOT_FOUND'}  = \&HTTP_NOT_FOUND;

    $Test->exported_to($caller);
    $Test->plan(@_);
	}
	
=head1 FUNCTIONS

=over 4

=item http_ok( URL [, HTTP_STATUS] )

Print the ok message if the URL's HTTP status matches the specified
HTTP_STATUS.  If you don't specify a status, it assumes you mean
HTTP_OK (from Apache::Constants).

=cut

sub http_ok
	{
	my $url      = shift;
	my $expected = shift || HTTP_OK;

	my $hash = _get_status( $url );
			
	my $status = $hash->{status};
	
	if( defined $expected and $expected eq $status )
		{
		$Test->ok( 1, "Expected [$expected], got [$status] for [$url]");
		}
	elsif( $status == NO_URL )
		{
		$Test->ok( 0, "[$url] does not appear to be anything");
		}
	elsif( $status == INVALID_URL )
		{
		$Test->ok( 0, "[$url] does not appear to be a valid URL");
		}
	else
		{
		$Test->ok( 0, "Mysterious failure for [$url]" );
		}
	}

sub _get_status
	{
	my $string = shift;
	
	return { status => NO_URL } unless defined $string;

	my $url = URI->new($string)->canonical;
	return { result => INVALID_URL } 
		unless UNIVERSAL::isa( $url, 'URI' );
		
	my $status = HTTP::SimpleLinkChecker::check_link( $url );
	
	return { url => $url, status => $status };
	}

=head1 SEE ALSO

Apache::Constants, HTTP::SimpleLinkChecker

=head1 AUTHOR

brian d foy, E<lt>bdfoy@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2002, brian d foy, All Rights Reserved.

You may use, modify, and distribute this package under the
same terms as Perl itself.

=cut

1;
