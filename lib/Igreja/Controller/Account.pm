package Igreja::Controller::Account;
use Mojo::Base 'Igreja::Controller::Base';

# This action will render a template
sub login {
    my $self = shift;

    if ( $self->is_post ) {

        # form params
        my $username    = $self->param('usuario')    || undef;
        my $password = $self->param('senha') || undef;

        # user found
        if ( $self->authenticate( $username, $password ) ) {
            return $self->redirect_to('/principal');
        }

    }

    return $self->render( message => 0 );
}

sub logout {
    my $self = shift;

    $self->session( expires => 1 );
    return $self->redirect_to('/login');
}

1;
