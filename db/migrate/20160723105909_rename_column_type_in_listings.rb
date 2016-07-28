class RenameColumnTypeInListings < ActiveRecord::Migration[5.0]
  def change
  	change_table :listings do |t|
  		t.rename :type, :room_type
  	end
  end
end
