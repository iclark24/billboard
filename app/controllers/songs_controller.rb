class SongsController < ApplicationController
  before_action :set_board, only: []
  before_action :set_artist, only: [:index, :new, :create, :edit, :update]
  before_action :set_song, only: [:show, :update, :destroy, :edit]
  
  def index
    @songs = @artist.songs
  end

  def show
  end

  def new
    @song = @artist.songs.new
  end

  def edit
    @existingboards = Board.all
  end

  def update
    if @song.update(board_song_params)
      redirect_to artist_songs_path
    else
      render :edit
    end
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_songs_path
    else
      render :new
    end
  end
  
  def destroy
    @song.destroy
    redirect_to artist_songs_path
  end

  private
    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:name)
    end

    def board_song_params
      params.require(:song).permit(:board_id)
    end
end