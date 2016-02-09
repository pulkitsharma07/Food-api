class Order < ActiveRecord::Base

	has_many :order_details
	has_many :food_items , :through => :order_details
	belongs_to :user
end
