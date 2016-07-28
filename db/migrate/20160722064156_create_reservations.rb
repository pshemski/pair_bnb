class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
    	t.belongs_to :user
    	t.belongs_to :listing
    	t.datetime :start_date
    	t.datetime :end_date
      t.timestamps
    end
  end
end
