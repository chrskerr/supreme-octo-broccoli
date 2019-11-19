class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.text :code
      t.text :seat
      t.integer :flight_id
      t.integer :user_id

      t.timestamps
    end
  end
end
