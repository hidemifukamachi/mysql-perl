use strict;
use warnings;
use utf8;
use DBI;

my $src=
{
  dsn => "dbi:mysql:;mysql_socket=/pass/to/mysql.sock",
  user => "root",
  password => "",
  datadir => "/pass/to/datadir"
};

my $src_connection=DBI->connect($src->{dsn}, $src->{user}, $src->{password});

my @schemas= map { $_->[0]; } @{$src_connection->selectall_arrayref("SHOW DATABASES")};

foreach my $schema (@schemas)
{
  ### p_s,i_s,mysql,sys ignored.
        next if grep { $schema eq $_ } qw{information_schema performance_schema mysql sys};
        print "$schema \n";
}

