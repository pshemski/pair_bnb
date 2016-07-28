class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
    	t.belongs_to :user
			t.string :name
    	t.string :location
    	t.integer :num_of_rooms
    	t.integer :price
      t.timestamps null: :false
    end
  end
end
