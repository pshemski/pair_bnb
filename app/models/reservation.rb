class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	has_one :payment
	validates_presence_of :start_date, :end_date
end
