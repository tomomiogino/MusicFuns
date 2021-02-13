class FansController < ApplicationController
  def create
    fan = current_user.fans.create(artist_id: params[:artist_id])
    redirect_to artist_path(fan.artist), flash: {success: t('flash.success.fan.create', artist: fan.artist.name)}
  end

  def destroy
    fan = current_user.fans.find_by(id: params[:id]).destroy
    redirect_to artist_path(fan.artist), flash: {danger: t('flash.alert.fan.create', artist: fan.artist.name)}
  end
end
