class SongsController < ApplicationController
  def index
    @songs = Song.all 
  end

  def new
    @song = Song.new 
  end

  def create
    @song = Song.new
    @song.name = params[:song][:name]
    @song.artist_id = params[:artist_id]
    @song.genre_id = params[:genre_id]
    @song.save 
    redirect_to song_path(@song)
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update()
    redirect_to song_path(@song)
  end
  
  private
  
    def song_params
      params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end
