class ReservationsController < ApplicationController
	before_action :set_reservation, only: [:edit, :update, :destroy, :show]
	before_action :require_login

  def new
  	@reservation = Reservation.new
  end

  def confirmation
    @reservation = current_user.reservations.new(reservation_params)
    validate_dates(@reservation.start_date, @reservation.end_date, @reservation.listing_id)
  end

  def create
  	@reservation = current_user.reservations.new(reservation_params)
  	if @reservation.save
      ReservationJob.perform_later(@reservation)
  		redirect_to reservation_path(@reservation.id)
  	else
  		render :new
  	end
 end 	

  def show
  end

  def index
  	@reservation = Reservation.all
  end

  def edit
  end

  def update
    @reservation.update(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation.id)
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def set_reservation
  	@reservation = Reservation.find(params[:id])
  end

  def reservation_params
  	params.require(:reservation).permit(:start_date, :end_date, :listing_id)
  end

  def validate_dates(start_date,end_date,listing_id)
    @verify_start = start_date
    @verify_end = end_date
    @listing_ref = listing_id

    compare = Reservation.where(:listing_id => @listing_ref)

    compare.each do |dates|
      if (@verify_start >= dates.start_date) && (@verify_start <= dates.end_date)
        flash[:alert] = 'The property is not available on the checkin date'
        redirect_to new_reservation_path(:listing_id => @listing_ref) and return
      elsif (@verify_end >= dates.start_date) && (@verify_end <= dates.end_date)
        flash[:alert] = 'The property is not available on the checkout date'
        redirect_to new_reservation_path(:listing_id => @listing_ref) and return
      else
        flash.now[:success] = 'Reservation successfull'
      end
    end 
  end
end













