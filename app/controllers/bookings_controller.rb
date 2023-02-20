class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_id])
        params[:passenger_quantity].to_i.times{@booking.passengers.build}
    end

    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            @booking.passengers.each do |passenger|
                PassengerMailer.with(passenger: passenger, flight: @booking.flight).welcome_email.deliver_later
            end
            flash[:notice] = "Booking created successfully!"
            redirect_to booking_path(@booking)
        else
            flash[:alert] = "Booking failed!"
            redirect_to new_booking_path(flight_id: @booking.flight_id, passenger_quantity: params[:passenger_quantity] || 1)
        end
    end

    def show
        @booking = Booking.find(params[:id])
    end

    private

    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
end
