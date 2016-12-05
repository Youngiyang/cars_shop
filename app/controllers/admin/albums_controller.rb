class Admin::AlbumsController < ApplicationController
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

    private
      def album_params
        params.require(:album).permit(:name, :description)
      end

end
