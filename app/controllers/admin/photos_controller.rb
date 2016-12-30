class Admin::PhotosController < ApplicationController
def index
    @photos = Photo.order(created_at: :desc).where(album_id: params[:album_id]).paginate(page: params[:page], per_page: 10)
    @albums = Album.find(params[:album_id])
    @photo = @albums.photos.new
end

  def new
    # @albums = Album.find(params[:album_id])
    # @photo = @albums.photos.new
    # @photos = @albums.photos
  end

  def create
    params[:photo][:name].each do |t|
      @photo = Photo.new
      @photo.album_id = params[:album_id]
      @photo.img_url = t
      @photo.save!
    end
    redirect_to admin_album_photos_path(params[:album_id])
  end


  def show
    @advertisement = Advertisement.find(params[:id])
  end


  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to admin_album_photo_path
    else
      render :edit
    end
  end

  def destroy
    arr = params[:id].split(",")
    if Photo.delete(arr)
      render json: arr
    else
      render json: { :success=> false, :msg=>'失败' }
    end
  end


end
