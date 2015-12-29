package Amon2::CLI;
use strict;
use warnings;
use Carp qw/croak/;

our $VERSION = '0.01';

sub new {
    my $class = shift;
    my $args  = shift || +{};

    bless $args, $class;
}

1;

__END__

=encoding UTF-8

=head1 NAME

Amon2::CLI - one line description


=head1 SYNOPSIS

    use Amon2::CLI;


=head1 DESCRIPTION

Amon2::CLI is


=head1 REPOSITORY

=begin html

<a href="http://travis-ci.org/bayashi/Amon2-CLI"><img src="https://secure.travis-ci.org/bayashi/Amon2-CLI.png"/></a> <a href="https://coveralls.io/r/bayashi/Amon2-CLI"><img src="https://coveralls.io/repos/bayashi/Amon2-CLI/badge.png?branch=master"/></a>

=end html

Amon2::CLI is hosted on github: L<http://github.com/bayashi/Amon2-CLI>

I appreciate any feedback :D


=head1 AUTHOR

Dai Okabayashi E<lt>bayashi@cpan.orgE<gt>


=head1 SEE ALSO

L<Other::Module>


=head1 LICENSE

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=cut
