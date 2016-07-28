class RenameNumberOfGuestsAndNameInListings < ActiveRecord::Migration[5.0]
  def change
  	change_table :listings do |t|
  		t.rename :name, :type
  		t.rename :num_of_rooms, :guests_limit
  	end
  end
end
