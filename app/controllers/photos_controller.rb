class PhotosController < ApplicationController


  def index
    if params[:tag]
      @photos = Photo.tagged_with(params[:tag])
    else
      @photos = Photo.all
    end
  end


  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.create(photos_params)
    redirect_to albums_path(@album)
  end

  private
  def photos_params
    params.require(:photo).permit(:image, :album_id, :tag_list)
  end
end
