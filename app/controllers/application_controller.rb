class ApplicationController < ActionController::Base
  private
  def verify_logged_in_with_admin_privs
    unless helpers.amesa_admin_privs?
      redirect_to pages_home_path, notice: 'You do not have access to the page you tried to visit!'
    end
  end
end
