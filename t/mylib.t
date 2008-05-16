#!perl -w

use Test;
plan tests => 4;

use mylib qw($Prefix $Bin $Lib);
use Foo;

ok($Foo::VERSION);
ok($Prefix);
ok("$Prefix/lib", $Lib);
ok($Bin);

