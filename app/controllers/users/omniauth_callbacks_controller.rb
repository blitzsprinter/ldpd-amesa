class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Cul::Omniauth::Callbacks

  skip_before_action :verify_authenticity_token, only: [:developer]

  def developer
    current_user = User.find_or_create_by(email: 'dev_admin@example.com', provider: :developer, uid: 'dev_uid')
#    current_user ||= User.find_or_create_by(
#      uid: request.env['omniauth.auth'][:uid], provider: :developer
#    )
    sign_in_and_redirect current_user, event: :authentication
  end
end
