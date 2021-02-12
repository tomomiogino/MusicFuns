class ArtistsController < ApplicationController
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  def index
    @artists = Artist.all
    if params[:search].present?
      @searchartists = RSpotify::Artist.search(params[:search], market: 'JP')
    end
  end

  def new
  end

  def show
  end
end
