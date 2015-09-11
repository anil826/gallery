class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @album = current_user.albums
  end

  def new
    @album = Album.new
  end

  def show
  end

  def create
    @album = current_user.albums.create(album_params)
    if @album.save
      redirect_to albums_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to albums_path
    else
      render 'edit'
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_path
  end


private

  def set_album
    @album = current_user.albums.where(id: params[:id]).take
  end

  def album_params
    params.require(:album).permit(:name, :user_id, photos_attributes: [:id,:image])
  end
end
