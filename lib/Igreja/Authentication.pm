package Igreja::Authentication;

use Mojo::ByteStream;

sub load_user {
    my ($class, $app, $uid) = @_;

    my $dbh = Igreja::Model::Database->connect;

    my $sth = $dbh->prepare( "SELECT * FROM `Usuario` WHERE `cod_usuario` = ?" );

    $sth->execute( $uid );

    my $user = $sth->fetchall_hashref('cod_usuario'); 
    #return $schema->resultset('Usuario')->find($uid);
    return $user->{$uid}->{cod_usuario};
}

sub validate_user {
    my ( $class, $app, $username, $password, $extas ) = @_;

    my $dbh = Igreja::Model::Database->connect;    

    my $sth = $dbh->prepare( "SELECT * FROM `Usuario` WHERE `usuario` = ? AND `senha` = ?" );

    #my $bs = Mojo::ByteStream->new($password);

    $sth->execute( $username, $password );

    my $user = $sth->fetchall_hashref('cod_usuario');

    # user found
    my $uid;
    map { $uid = $user->{$_}->{cod_usuario} } keys %{$user};
    return $uid || undef if $user;
}

1;
