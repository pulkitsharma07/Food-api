require 'rails_helper'

describe "Order Endpoint", :type => :request do
 
  	before(:each) do
    	post "/api/v1/user/new?username=Tester"
		json = JSON.parse(response.body)
		@api_key = json["api_key"]
  	end

	it "creates an order" do

		post "/api/v1/order/create?api_key=#{@api_key}"
		json = JSON.parse(response.body)
		expect(response.status).to eq (400)
		expect(json["status"]).to eq ("failure")
	end

	it "fails on an invalid api_key" do
		post "/api/v1/order/create?api_key=2233ddssssd"
		json = JSON.parse(response.body)
		expect(response.status).to eq (401)
		expect(json["message"]).to eq ("Invalid API Token")
	end
end