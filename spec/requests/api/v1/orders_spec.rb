require 'rails_helper'

describe "Order Endpoint", :type => :request do
 
  	before(:each) do
  		
  		post "/api/v1/food_items/create?name=Burger&price=100&quantity=40" 
  		post "/api/v1/food_items/create?name=Pizza&price=120&quantity=100" 
  		
    	post "/api/v1/user/create?username=Tester"
    	
		json = JSON.parse(response.body)
		@api_key = json["api_key"]
  	end

	it "Does not create an  empty order" do
		post "/api/v1/order/create?api_key=#{@api_key}"
		json = JSON.parse(response.body)
		expect(response.status).to eq (400)
		expect(json["status"]).to eq ("failure")
	end
	
	it "creates an order" do
		
		post "/api/v1/order/create?api_key=#{@api_key}&items[][food_item_id]=1&items[][quantity]=5"
		json = JSON.parse(response.body)
		expect(response.status).to eq (200)
		
	end
	
	it "fails on an invalid api_key" do
		post "/api/v1/order/create?api_key=2233ddssssd"
		json = JSON.parse(response.body)
		expect(response.status).to eq (401)
		expect(json["message"]).to eq ("Invalid API Token")
	end
end

describe "Placed Order", :type => :request do
		before(:each) do
  		
  			post "/api/v1/food_items/create?name=Burger&price=100&quantity=40" 
  			post "/api/v1/food_items/create?name=Pizza&price=120&quantity=100" 

    		post "/api/v1/user/create?username=Tester"
			json = JSON.parse(response.body)
			@api_key = json["api_key"]
		end

		it "should decrease the quantity_left" do
			
			post "/api/v1/order/create?api_key=#{@api_key}&items[][food_item_id]=1&items[][quantity]=5"
		end
end

describe "Order Content", :type => :request do

		before(:each) do
  		
  			post "/api/v1/food_items/create?name=Burger&price=100&quantity=40" 
  			post "/api/v1/food_items/create?name=Pizza&price=120&quantity=100" 

    		post "/api/v1/user/create?username=Tester"
			json = JSON.parse(response.body)
			@api_key = json["api_key"]
			
			# an order is placed containing two food_items
			post "/api/v1/order/create?api_key=#{@api_key}&items[][food_item_id]=1&items[][quantity]=5&items[][food_item_id]=2&items[][quantity]=15"
  		end
  	
  	
  		it "should have correct number of order_detail elements" do
  			
    		get "/api/v1/order/view?api_key=#{@api_key}&order_id=1"
			json = JSON.parse(response.body)
			
			expect(json["order"]["order_details"].count).to eq(2)
  		end
  		
  		it "should have correct total_price" do
  			
    		get "/api/v1/order/view?api_key=#{@api_key}&order_id=1"
			json = JSON.parse(response.body)
			
			sum = 0;
			
			json["order"]["order_details"].each do |odt|
				sum += odt["quantity"].to_i*odt["price"].to_i	
			end
			expect(json["order"]["total_price"].to_i).to eq(sum)
  		end
  	
end