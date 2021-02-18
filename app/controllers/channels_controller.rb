class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show]
  before_action :authenticate_user

  def new
    @channel = Channel.new
    @artist = Artist.find_by(id: params[:artist_id])
  end

  def create
    @artist = Artist.find_by(id: params[:artist_id])
    @channel = @artist.channels.build(channel_params)
    if @channel.save
      redirect_to artist_path(@artist), flash: {success: t('flash.success.channel.create', channel: @channel.name)}
    else
      flash.now[:danger] = t('flash.alert.channel.create')
      render :new
    end
  end

  def show
    @comments = @channel.comments.order(created_at: :desc).page(params[:page]).per(10)
    @comment = @channel.comments.build
  end

  private

  def channel_params
    params.require(:channel).permit(:name)
  end

  def set_channel
    @channel = Channel.find(params[:id])
  end

  def set_artist
    @artist = Artist.find_by(params[:artist_id])
  end
end
