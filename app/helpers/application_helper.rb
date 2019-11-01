module ApplicationHelper
  def amesa_admin_privs?
    user_signed_in? && CONFIGS[:admins].include?(current_user.uid)
  end
end
