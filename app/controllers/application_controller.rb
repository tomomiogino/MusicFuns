class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user
    redirect_to new_session_path, flash: {danger: t('flash.alert.session.login is needed')} unless logged_in?
  end
end
