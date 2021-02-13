class RelationshipsController < ApplicationController
  def create
    if logged_in?
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
      flash[:success] = I18n.t('flash.success.relationship.create', user: @user.name)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    flash[:danger] = I18n.t('flash.alert.relationship.destroy', user: @user.name)
    redirect_back(fallback_location: root_path)
  end
end
