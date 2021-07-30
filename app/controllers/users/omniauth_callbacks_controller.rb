class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Cul::Omniauth::Callbacks

  skip_before_action :verify_authenticity_token, only: [:developer]

  def developer
    # fcd1, 07/30/21: Following two lines are my original code. Never worked right, if I remember correctly
    # I had to go into the db and delete the previous iteration of the user before being able to log in
    # current_user = User.find_or_create_by(email: 'dev_admin@example.com', provider: :developer, uid: 'dev_uid')
    # sign_in_and_redirect current_user, event: :authentication

    # Following code comes from elo2112
    return unless Rails.env.development?
    # Allow the developer user to sign in with whatever uid they typed in
    unless user_signed_in?
      dev_user_data = {
        uid: params[:uid],
        provider: :developer
      }
      dev_user = User.find_by(uid: dev_user_data[:uid]) || User.create!(dev_user_data)
      sign_in(dev_user, scope: :user, provider: dev_user_data[:provider])
    end
    redirect_to root_path
  end
end
