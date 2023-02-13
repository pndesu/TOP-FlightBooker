class CreateBookingsPassengers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :bookings, :passengers do |t|
      t.index :booking_id
      t.index :passenger_id
      
      t.timestamps
    end
  end
end
