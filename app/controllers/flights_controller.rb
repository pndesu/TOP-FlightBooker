class FlightsController < ApplicationController
    def index
        @departure_airport_options = Airport.all.map{|a| [a.name, a.id]}.unshift(["-", ""])
        @arrival_airport_options = Airport.all.map{|a| [a.name, a.id]}.unshift(["-", ""])
        @departure_time_options = Flight.all.select(:departure_time).order(:departure_time).map{|f| [f.departure_time.strftime("%m/%d/%Y"), f.departure_time]}.uniq{|t| t[0]}.unshift(["-", ""])
        @flights = Flight.all.order(:departure_time)
        if params[:departure_airport_id].present?
            @flights = @flights.where(departure_airport_id: params[:departure_airport_id])
        end
        if params[:arrival_airport_id].present?
            @flights = @flights.where(arrival_airport_id: params[:arrival_airport_id])
        end
        
        if params[:departure_time].present?
            departure_time = params[:departure_time].to_date.beginning_of_day
            @flights = @flights.where(departure_time: departure_time..departure_time.end_of_day)
        end
    end
end
