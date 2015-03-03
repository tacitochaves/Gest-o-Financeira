package Igreja;
use Mojo::Base 'Mojolicious';

use Igreja::Model::Database;
use Igreja::Authentication;

# This method will run once at server start
sub startup {
    my $self = shift;

    $self->helper( 'schema' => sub { Igreja::Model::Database->connect } );

    # load auth plugin
    $self->plugin(
            authentication  => {
            'autoload_user' => 1,
            'session_key'   => 'uid',
            'stash_key'     => 'auth_user',
            'load_user'     => sub {
               return Igreja::Authentication->load_user(@_);
            },
            'validate_user' => sub {
               return Igreja::Authentication->validate_user(@_);
            },
        }
    );

    # Router
    my $r = $self->routes;

    $r->namespaces( ["Igreja::Controller"] );

    # Normal route to controller
    $r->get('/')->to('home#index');

    # Configurações - Controle Gerencial de Finanças
    # login
    $r->any('/login')->to( controller => 'Account', action => 'login' );
    $r->any('/logout')->over( authenticated => 1 )->to( controller => 'Account', action => 'logout' );

    # tela principal
    $r->get('/principal')->over( authenticated => 1 )->to( controller => 'Menu', action => 'inicio' );

    # tela do menu de cadastro
    $r->any('/cadastro')->over( authenticated => 1 )->to( controller => 'Menu', action => 'cadastro' );

    # tela de nota fiscal
    $r->any('/nota')->over( authenticated => 1 )->to( controller => 'Nota', action => 'nota' );
}

1;
