class ReservationMailer < ApplicationMailer
  default from: 'marcoprzemski@gmail.com'
  
  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'booking confirmation')
  end

  def host_email(host)
  	@host = host
  	mail(to: @host.email, subject: 'new booking')
  end	
end
