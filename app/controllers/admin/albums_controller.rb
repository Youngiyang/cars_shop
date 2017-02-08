class Admin::AlbumsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @albums = Album.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to admin_albums_path
    else
      render :index
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to admin_albums_path
  end

    private
      def album_params
        params.require(:album).permit(:name, :description)
      end

end
