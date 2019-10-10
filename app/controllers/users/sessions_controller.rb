class Users::SessionsController < Devise::SessionsController
  def new_session_path(scope)
    new_user_session_path # this accomodates Users namespace of the controller
  end

  def omniauth_provider_key
    # there is support for :wind, :cas, and :saml in Cul::Omniauth
    # fcd1, 10/11/19: use a config entry instead of 'developer'
    Rails.env.development? ? 'developer' : 'saml'
  end

  # (Without this, visit /users/auth/saml explicitly)
  # GET /resource/sign_in
  def new
    if Rails.env.development?
      redirect_to user_developer_omniauth_authorize_path
    else
      redirect_to user_saml_omniauth_authorize_path
    end
  end
end
