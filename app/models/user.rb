class User < ApplicationRecord
  include Cul::Omniauth::Users

  # Password methods required by Devise.
  def password
    Devise.friendly_token[0,20]
  end

  def password=(*val)
    # NOOP
  end
end
