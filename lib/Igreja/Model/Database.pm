package Igreja::Model::Database;

use DBI;

sub connect {
    my $conf = {
        database => "dbi:mysql:dbname=Financas;host=192.168.5.205:3306",
        username => "chaves",
        password => "ildenice",
        RaiseError => 1,
        AutoCommit => 0,
    };
    return DBI->connect( $conf->{database}, $conf->{username},
        $conf->{password}, { $conf->{RaiseError}, $conf->{AutoCommit} } ) or die "$DBI::errstr\n";
}
       
1;
