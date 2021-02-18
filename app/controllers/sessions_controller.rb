class SessionsController < ApplicationController
  before_action :restrict_login_user, except: [:destroy]

  def new; end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to artists_path, flash: {success: t('flash.success.session.create')}
    else
      flash.now[:danger] = t('flash.alert.session.create')
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, flash: {success: t('flash.success.session.destroy')}
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
