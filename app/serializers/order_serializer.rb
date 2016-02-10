class OrderSerializer < ActiveModel::Serializer
  attributes :id,:delivered,:payment ,:total_price
  has_many :order_details

  def total_price
  	
  	tot = 0
  	object.order_details.all.each do |odt|
  		tot += odt.quantity * odt.food_item.price
  	end
  	
  	"#{tot}"
  end

end
