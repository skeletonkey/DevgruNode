#!/usr/bin/env perl

use strict;
use warnings;

use Test::Exception;
use Test::More;

plan tests => 11;

use_ok( 'Devgru::Node' ) || print "Bail out!\n";

my $test_name = 'Test';
my $end_point = 'EndPoint';

my $node = Devgru::Node->new(
    name      => $test_name,
    end_point => $end_point,
);

is($node->name, $test_name, 'Correct name');
$node->name('New Test');
is($node->name, 'New Test', 'Correct New name');

is($node->end_point, $end_point, 'Correct end_point');
$node->name('New EndPoint');
is($node->name, 'New EndPoint', 'Correct New end_point');

#is($node->current_version, 0, 'Correct current_version');
$node->current_version('1.1.1');
is($node->current_version, '1.1.1', 'Correct New current_version');

#is($node->down_count, 0, 'Correct down_count');
$node->down_count(1);
is($node->down_count, 1, 'Correct New down_count');

$node->inc_down_count;
$node->inc_down_count;
is($node->down_count, 3, 'Correct Incremented down count');

#is($node->fail_reason, '', 'Correct fail_reason');
$node->fail_reason('New Reason');
is($node->fail_reason, 'New Reason', 'Correct New fail_reason');

#is($node->last_check, 0, 'Correct last_check');
$node->fail_reason(1234);
is($node->fail_reason, 1234, 'Correct New last_check');

#is($node->status, '', 'Correct status');
$node->fail_reason('Success');
is($node->fail_reason, 'Success', 'Correct New status');

#throws_ok { Devgru::Node->new(); } qr/No name provided for Devgru::Node/, 'No Name provied';
#throws_ok { Devgru::Node->new( name => 'name' ); } qr/No end_point provided for/, 'No end_point provied';
