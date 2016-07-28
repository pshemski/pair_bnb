class ReservationJob < ApplicationJob
  queue_as :default

  def perform(reservation)
    # Do something later
    # Sends email to user and host when reservation is created.
      ReservationMailer.sample_email(reservation.user).deliver_now
      ReservationMailer.host_email(reservation.listing.user).deliver_now
      #format.html { redirect_to @user, notice: 'User was successfully created.' }
      #format.json { render :show, status: :created, location: @user }
  end
end
