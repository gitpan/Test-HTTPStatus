# $Id: Makefile.PL,v 1.6 2005/03/08 23:10:55 comdog Exp $
use ExtUtils::MakeMaker;

eval "use Test::Manifest";

unless( $@ )
	{
	no warnings;
	
	* ExtUtils::MM_Any::test_via_harness = sub
		   {
		   my($self, $perl, $tests) = @_;
	
		   return qq|\t$perl "-MTest::Manifest" | .
					  qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
					  qq|'\$(INST_ARCHLIB)')"\n|;
		   }
	}

WriteMakefile
        (
        'NAME'         => 'Test::HTTPStatus',
        'VERSION_FROM' => 'lib/HTTPStatus.pm',
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
