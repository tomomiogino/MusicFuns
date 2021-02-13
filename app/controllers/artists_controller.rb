class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show]

  require 'rspotify'

  def index
    RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])
    @artists = Artist.all
    if params[:search].present?
      @searchartists = RSpotify::Artist.search(params[:search], market: 'JP')
    end
  end

  def new
    @artist = Artist.new(name: params[:name])
    @image = params[:image]
  end

  def create
    @artist = Artist.new(artist_params)
    if params[:image]
      @artist.remote_image_url = params[:image]
    end
    if @artist.save
      redirect_to artist_path(@artist.id), flash: {success: t('flash.success.artist.create', artist: @artist.name)}
    else
      flash.now[:danger] = t('flash.alert.artist.create')
      render :new
    end
  end

  def show
    @channels = @artist.channels
    @fan = current_user.fans.find_by(artist_id: @artist.id)
    @fans = Fan.where(artist_id: @artist.id)
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :image, :image_cache)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
