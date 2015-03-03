package Igreja::Controller::Menu;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub inicio {
    my ( $self, $uid ) = @_;

}

sub cadastro {
    my $self = shift;
    
    # conectando no banco
    my $dbh = $self->schema;

    # carrega as informações do template cadastro.html
    my $nome_banco = $self->param("banco")   or undef; 
    my $agencia    = $self->param("agencia") or undef;
    my $conta      = $self->param("conta")   or undef;

    # cadastra banco na base de dados
    my $sth = $dbh->prepare("INSERT INTO `Banco` (`nome`, `agencia`, `conta`) VALUES ('$nome_banco', '$agencia', '$conta')") 
    if defined $nome_banco and $agencia and $conta;
    $sth->execute() if defined $nome_banco and $agencia and $conta;

    my $nome = $self->param("nome") or undef;
    my $razao = $self->param("razao") or undef;
    my $cpf   = $self->param("cpf")   or undef;
    my $endereco = $self->param("endereco") or undef;
    my $bairro   = $self->param("bairro") or undef;
    my $cep      = $self->param("cep") or undef;
    my $telefone = $self->param("telefone") or undef;
    my $email    = $self->param("email") or undef;

    
}

1;
