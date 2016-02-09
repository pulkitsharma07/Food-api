class FoodItemSerializer < ActiveModel::Serializer
  attributes :id,:name,:quantity_left,:price
end
