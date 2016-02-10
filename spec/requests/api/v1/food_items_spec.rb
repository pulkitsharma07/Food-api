require 'rails_helper'

describe "Food Items Endpoint", :type => :request do

	it "create a food item" do
		
		post "/api/v1/food_items/create?name=Burger&price=100&quantity=40" 
		json = JSON.parse(response.body)
		expect(response.status).to eq (200)
		expect(json["food_item"]["name"]).to eq ("Burger")
	end

	# it "returns an error for invalid parameters" do

	# 	post "/api/v1/user/new"
	# 	json = JSON.parse(response.body)
	# 	expect(response.status).to eq(400)
	# end
end