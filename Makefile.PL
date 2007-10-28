# $Id: Makefile.PL 2344 2007-10-28 01:57:39Z comdog $
use ExtUtils::MakeMaker;

eval "use Test::Manifest 1.14";

WriteMakefile
	(
	'NAME'          => 'Test::HTTPStatus',
	'ABSTRACT'      => 'check an HTTP status',
	'VERSION_FROM'  => 'lib/HTTPStatus.pm',
	'LICENSE'		=> 'perl',
	'AUTHOR'		=> 'brian d foy <bdfoy@cpan.org>',

	'PREREQ_PM' => {
		'Test::Builder'            => '0',
		'Test::More'               => '0',
		'HTTP::SimpleLinkChecker'  => '0',
		'URI'                      => '0',
		'Carp'                     => '0',
		},

	'PM'        => 
		{
		'lib/HTTPStatus.pm' => '$(INST_LIBDIR)/HTTPStatus.pm',
		},
	
	'MAN3PODS' =>
		{
		'lib/HTTPStatus.pm' => '$(INST_LIBDIR)/Test::HTTPStatus.3',
		},
	
	clean  => { FILES => 'Test-HTTPStatus-*' },
	);

