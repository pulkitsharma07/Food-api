class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id,:quantity,:item,:price


  def item
  	"#{object.food_item.name}"
  end

  def price
  	"#{object.food_item.price}"
  end
end
