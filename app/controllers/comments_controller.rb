class CommentsController < ApplicationController
  before_action :set_channel, only: [:create]

  def create
    @comment = @channel.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        flash.now[:notice] = "コメントを投稿しました！"
        format.js { render :index}
      else
        flash.now[:notice] = "投稿に失敗しました・・・"
        format.js { render :index }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = Comment.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
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
