class AddArrivalAirportIdToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :arrival_airport_id, :integer
  end
end
