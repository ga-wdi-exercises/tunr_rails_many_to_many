class SongsController < ApplicationController
  before_action :authenticate_user!, only: [:add_favorite, :remove_favorite]
  # index
  def index
    @songs = Song.all
  end

  # new
  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  # create
  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    redirect_to @song
  end

  #show
  def show
    @song = Song.find(params[:id])
  end

  # edit
  def edit
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
  end

  # update
  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to @song
  end

  # destroy
  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  def add_favorite
    @song = Song.find(params[:id])
    @song.favorites.create(user: current_user)
    redirect_to :back
  end

  def remove_favorite
    Favorite.where(user: current_user, song_id: params[:id]).destroy_all
    redirect_to :back
  end

  private
  def song_params
    params.require(:song).permit(:title, :album, :preview_url, :artist_id)
  end
end
