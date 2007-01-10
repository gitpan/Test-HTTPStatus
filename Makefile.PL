# $Id: Makefile.PL,v 1.7 2007/01/10 04:49:04 comdog Exp $
use ExtUtils::MakeMaker;

eval "use Test::Manifest 1.14";

WriteMakefile
	(
	'NAME'         => 'Test::HTTPStatus',
	'VERSION_FROM' => 'lib/HTTPStatus.pm',
	'LICENSE'       => 'perl',
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

