class ApplicationController < ActionController::Base
  private
  def verify_logged_in_with_admin_privs
    unless user_signed_in? && ADMINS.include?(current_user.uid)
      redirect_to pages_home_path, notice: 'You do not have access to the page you tried to access!'
    end
  end
end
