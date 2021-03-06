class ArtistsController < ApplicationController
  before_action :set_artist, only: [
                  :show,
                  :edit,
                  :update,
                  :destroy
                  ]
  before_action :set_shops,
                only: [
                  :new,
                  :edit
                ]
  before_action :signed_in_user

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    session[:return_to] ||= request.referer
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.html {redirect_to session.delete(:return_to), notice: "Artist created successfully"}
        #format.html {render :success, notice: "Artist created successfully"}        
      else
      format.html {render action: "new"}        
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html {redirect_to artist_path(@artist.id), notice: "Artist sucessfully updated."
        }
      else
        format.html {render action: "edit"}
      end
    end
  end

  def destroy
    @artist.destroy
    respond_to do |format|
      format.html {redirect_to artists_path}
    end
  end

  private
  def set_artist 
    @artist = Artist.find(params[:id])
  end

  def set_shops
    @shops = []
    shops = Shop.all
    shops.each do |shop|
      @shops << [shop.name, shop.id]
    end
  end

  def artist_params
    params.require(:artist) .permit(:name,
                                    :nick,
                                    :email,
                                    :shop_id,
                                    :url
                                    )
  end

   # confirms a user is signed in
  def signed_in_user
    unless signed_in?
      flash[:danger] = "Please sign in to access that page."
      redirect_to signin_url
    end
  end
end
