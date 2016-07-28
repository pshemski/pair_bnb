class CreatePayments < ActiveRecord::Migration[5.0]
  def change
  	create_table :payments do |t|
  		t.belongs_to :reservation
  		t.timestamps
  	end
  end
end
