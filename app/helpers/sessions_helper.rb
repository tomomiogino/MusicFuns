module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def restrict_login_user
    redirect_to artists_path, flash: {warning: t('flash.alert.session.logged in')} if logged_in?
  end

  def ensure_correct_user
    redirect_to artists_path, flash: {danger: t('flash.alert.session.Another user')} if current_user.id != params[:id].to_i
  end
end