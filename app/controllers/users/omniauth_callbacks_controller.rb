class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Cul::Omniauth::Callbacks

  skip_before_action :verify_authenticity_token, only: [:developer]

  def developer
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
