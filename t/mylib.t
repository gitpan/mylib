#!perl -w

use Test;
plan tests => 1;

use mylib;
use Foo;

ok($Foo::VERSION);
