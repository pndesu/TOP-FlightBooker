class PassengerMailer < ApplicationMailer
    default from: 'tranvanphucnguyen1@gmail.com'

    def welcome_email
        @passenger = params[:passenger]
        @flight  = params[:flight]
        mail(to: @passenger.email, subject: 'Welcome onboard!')
    end
end
