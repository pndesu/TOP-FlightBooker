class BookingsController < ApplicationController
    def new
        @booking = Booking.new(flight_id: params[:flight_id])
        params[:passenger_quantity].to_i.times{@booking.passengers.build}
    end

    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            redirect_to booking_path(@booking)
            flash[:notice] = "Booking created successfully!"
        else
            flash.now[:alert] = "Ooops! Something went wrong..."
            render :new, status: :unprocessable_entity
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
