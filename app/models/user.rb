class User < ApplicationRecord
  include Cul::Omniauth::Users

  before_validation(:default_email, on: :create)

  # Password methods required by Devise.
  def password
    Devise.friendly_token[0,20]
  end

  def password=(*val)
    # NOOP
  end

  private

  def default_email
    mail = "#{self.uid}@columbia.edu"
    self.email = mail
  end
end
