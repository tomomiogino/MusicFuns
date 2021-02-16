class CommentsController < ApplicationController
  before_action :set_channel, only: [:create]
  before_action :authenticate_user

  def create
    @comment = @channel.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        flash.now[:notice] = t('flash.success.comment.create')
        format.js { render :index}
      else
        flash.now[:notice] = t('flash.alert.comment.create')
        format.js { render :index }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = t('flash.success.comment.edit')
      format.js { render :edit }
    end
  end

  def update
    @comment = Comment.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = t('flash.success.comment.update')
          format.js { render :index }
        else
          flash.now[:notice] = t('flash.alert.comment.update')
          format.js { render :edit }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = t('flash.success.comment.destroy')
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :channel_id, :user_id)
  end

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end
end
