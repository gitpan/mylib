package mylib;

use vars qw($VERSION @EXPORT_OK $Prefix);
$VERSION = "0.01";

require Exporter;
@EXPORT_OK = qw($Prefix $Bin $Lib);

use FindBin qw($Bin);

$Prefix = $Bin;
$Lib = "$Prefix/lib";

unless (-d $Lib) {
    require File::Basename;
    $Prefix = File::Basename::dirname($Prefix);
    $Lib = "$Prefix/lib";
    unless (-d $Lib) {
        die "Can't find lib in either $Bin or $Prefix, stopped";
    }
}

require lib;
lib->import($Lib);

1;

__END__

=head1 NAME

mylib - add private lib to the module search path

=head1 SYNOPSIS

  use mylib;

=head1 DESCRIPTION

This is just a convenient wrapper around L<FindBin> and L<lib> that
will prepend the F<lib> directory either found in the directory of the
script or its parent directory.  If neither of these locations contain
a F<lib> directory it will die.

The following variables can be imported:

=over

=item C<$Prefix>

This is the directory where the F<lib> directory is found.

=item C<$Lib>

This is the same as C<"$Prefix/lib">.

=item C<$Bin>

This is the same as C<$FindBin::Bin>.

=back

=head1 COPYRIGHT

Copyright 2008 Gisle Aas.

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=head1 SEE ALSO

L<rlib>, L<FindBin>, L<lib>
