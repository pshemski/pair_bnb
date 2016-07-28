class ListingsController < ApplicationController
	before_action :set_listing, only: [:edit, :update, :destroy, :show]
	before_action :require_login

  def new
  	@listing = Listing.new
    @reservation = Reservation.all
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing.id)
    else
      # redirect_to new_listing_path same as:
      render :new
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    if @listing.save
      redirect_to root_path
    else
      render :edit
    end    
  end

  def destroy
    @listing.destroy
    redirect_to root_path
  end

  def index
    @listings = Listing.all
  end

  def show
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params #white list of permitted parameters
    params.require(:listing).permit(:room_type, :guests_limit, :location, :price, {images: []})
  end
  
end
