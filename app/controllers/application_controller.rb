class ApplicationController < ActionController::Base
  around_action :switch_locale

  def default_url_options
    { locale: I18n.locale }
  end

  private
  def verify_logged_in_with_admin_privs
    unless helpers.amesa_admin_privs?
      redirect_to pages_home_path, notice: 'You do not have access to the page you tried to visit!'
    end
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
