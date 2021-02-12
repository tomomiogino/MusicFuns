class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), flash: {success: t('flash.success.user.create', user: @user.name)}
    else
      flash.now[:danger] = t('flash.alert.user.create')
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_comment, :image, :image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
