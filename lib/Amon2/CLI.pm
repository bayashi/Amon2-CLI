package Amon2::CLI;
use strict;
use warnings;

our $VERSION = '0.01';

sub import {
    my ($self, $app_class, $cli_class) = @_;

    if ($app_class) {
        my $file = $app_class;
        $file =~ s!::!/!g;
        require "$file.pm"; ## no critic
        $app_class->import;
        $app_class->load_plugins(
            'CLI' => {
                base => $cli_class || "${app_class}::CLI",
            },
        );
    }
}

1;

__END__

=encoding UTF-8

=head1 NAME

Amon2::CLI - The way of CLI for Amon2 App


=head1 SYNOPSIS

First of all, in your MyApp class

    package MyApp;
    use strict;
    use warnings;
    use parent qw/Amon2/;

    1;

Then in your MyApp::CLI::Foo class

    package MyApp::CLI::Foo;
    use strict;
    use warnings;

    sub main {
        my ($class, $c) = @_;
        # do something
        print 'done!';
    }

    1;

Finally, in your script

    use Amon2::CLI 'MyApp';

    MyApp->bootstrap->run('Foo'); # done!

Or directly,

    use Amon2::CLI 'MyApp';

    MyApp->bootstrap->run(sub{
        my ($c) = @_;
        # do something
        print 'kaboom!';
    });


=head1 DESCRIPTION

Amon2::CLI is B<ALPHA QUALITY>. B<I may change interfaces without a notice>.

This module gives you the easy way of CLI for Amon2 App. It handles to load class, to get options and to throw error.


=head1 CONFIGURE PLUGIN

You can write your own C<MyApp::CLI> class for customizing the way instead of C<Amon2::CLI>.

    package MyApp::CLI;
    use strict;
    use warnings;
    use MyApp::Logger;

    __PACKAGE__->load_plugins(
        'CLI' => {
            base => 'MyApp::CLI',
            on_error => sub {
                my ($c, $e) = @_;
                MyApp::Logger->write('path/to/log', $e);
            },
        },
    );

And in your script

    use MyApp::CLI;

    MyApp->bootstrap->run(sub{
        my ($c) = @_;
        # do something
        print 'OK!';
    });

=head2 PLUGIN OPTIONS

=head3 base

The base class name

=head3 on_error

The code ref for handling error

=head3 method // 'main'

The name of method in class for script

=head3 run_method // 'run'

The name of method on $c for invoking CLI script

=head3 getopt // [qw/:config posix_default no_ignore_case gnu_compat/]

The options string for L<Getopt::Long>

=head3 cli_opt_key

The key string for keeping CLI options in context


=head1 REPOSITORY

=begin html

<a href="http://travis-ci.org/bayashi/Amon2-CLI"><img src="https://secure.travis-ci.org/bayashi/Amon2-CLI.png"/></a> <a href="https://coveralls.io/r/bayashi/Amon2-CLI"><img src="https://coveralls.io/repos/bayashi/Amon2-CLI/badge.png?branch=master"/></a>

=end html

Amon2::CLI is hosted on github: L<http://github.com/bayashi/Amon2-CLI>

I appreciate any feedback :D


=head1 AUTHOR

Dai Okabayashi E<lt>bayashi@cpan.orgE<gt>


=head1 SEE ALSO

L<Amon2::Plugin::CLI>

L<Amon2>


=head1 LICENSE

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=cut
