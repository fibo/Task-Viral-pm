package Task::Viral;
use strict;
use warnings;

our $VERSION = '0.01';

1;

=head1 NAME

Task::Viral - Conquer hosts with a camel

=head1 DESCRIPTION

This bundle includes all the stuff you need to build a chain of hosts with Perl installed and CPAN modules you need updated, including your private packages.

=head2 WHAT IS A CHAIN?

Suppose you have the following topology.

    Internet <-- host-1 <-- host-2 <-- ... <-- host-N

where C<host-i> are, for instance, under C<.example.org> domain.

Here I call a B<chain> an array of hosts, where C<host-0> is some active CPAN mirror on Internet.

The C<host-(i+1)> can connect to C<host-i>. For example a B<chain> could be

    www.cpan.org <-- development.example.org <-- test.example.org <-- production.example.org

where test and production hosts cannot connect to Internet.

=head2 SETUP A CHAIN

Start from C<host-1>, launch

    cpan Task::Viral

Launch a L<cpanmirrorhttpd> to serve installed packages to C<host2>, for instance on port C<2000>

    cpanmirrorhttpd --root $HOME/.cpan/sources  --port 2000

Go to C<host-2> and configure L<cpan> to install packages from C<host1>.

    cpan> o conf urllist http://host-1.example.org:2000
    cpan> o conf commit

Now you can launch

    cpan Task::Viral

and iterate until C<host-N>.

Note that can happen that C<host-i> equals C<host-j> for some i ≠ j. In that case you just need to use different users and choose different ports.

=head1 STUFF INCLUDED

=over 4

=item *

L<CPAN::Mirror::Server::HTTP>

=item *

L<CPAN::Mini::Inject>

=back

=cut

