#!/usr/bin/perl -T
use 5.006;
use strict;
use warnings;
use Test::Tester;
use Test::More;
use Test::Version version_all_ok => {
	has_version        => 1,
	ignore_unindexable => 0,
	consistent         => 1,
};

my ( $premature, @results ) = run_tests(
	sub {
		version_all_ok('corpus/missing');
	}
);

is( scalar(@results), 4, 'correct number of results' );

my @oks = map { $_->{ok} } @results;

note( 'unsorted oks: ', @oks );

is_deeply( [sort @oks], [0, 0, 1, 1], 'oks are ok' );

done_testing;

