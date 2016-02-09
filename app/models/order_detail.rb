class OrderDetail < ActiveRecord::Base

	validate :valid_quantity

	after_create :reduce_quantity
	belongs_to :order
	belongs_to :food_item


	private

	def valid_quantity
		if quantity > FoodItem.find_by_id(food_item_id).quantity
			error.add(:quantity,"invalid quantity")
		end
	end	

	def reduce_quantity
		FoodItem.find_by_id(food_item_id).decrement(:quantity,quantity).save

	end

end
