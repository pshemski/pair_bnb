class StaticController < ApplicationController
  #skip_before_action :require_login, only: :index
  
  def index
  	@reservation = Reservation.new
  	@listings = Listing.all
  end
end
