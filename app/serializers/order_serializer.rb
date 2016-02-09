class OrderSerializer < ActiveModel::Serializer
  attributes :id,:delivered
  has_many :order_details
end
