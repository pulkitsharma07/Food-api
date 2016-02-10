require 'rails_helper'

describe "Food Items Endpoint", :type => :request do

	it "create a food item" do
		
		post "/api/v1/food_items/create?name=Burger&price=100&quantity=40" 
		json = JSON.parse(response.body)
		expect(response.status).to eq (200)
		expect(json["food_item"]["name"]).to eq ("Burger")
		
	end

	it " should list all the food_items" do

		post "/api/v1/food_items/create?name=Burger&price=100&quantity=40" 
  		post "/api/v1/food_items/create?name=Pizza&price=120&quantity=100" 
  		
  		get "/api/v1/food_items/view"
  		
  		json = JSON.parse(response.body)

		expect(response.status).to eq(200)
		expect(json["food_items"].count).to eq(2)
	end
	
	it "should list a particular item" do
		post "/api/v1/food_items/create?name=Burger&price=100&quantity=40" 
  		post "/api/v1/food_items/create?name=Pizza&price=120&quantity=100" 
  		
  		get "/api/v1/food_items/view?food_item_id=1"
  		
  		json = JSON.parse(response.body)
		p json
		expect(response.status).to eq(200)
		expect(json["food_item"]["name"]).to eq("Burger")
  		
	end
end