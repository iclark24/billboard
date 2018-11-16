class SongsController < ApplicationController
  before_action :set_board
  before_action :set_song, only: [:show, :update, :edit, :destroy]
  
  def index
    @songs = @board.songs
  end

  def show
  end

  def new
    @song = @board.songs.new
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to board_songs_path
    else
      render :edit
    end
  end

  def create
    @song = @board.songs.new(song_params)
    if @song.save
      redirect_to board_songs_path
    else
      render :new
    end
  end
  
  def destroy
    @song.destroy
    redirect_to board_songs_path
  end

  private
    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:name)
    end
end