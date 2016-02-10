require 'rails_helper'

describe "User Endpoint", :type => :request do

	it "creates a user" do

		username = "Pulkit"
		post "/api/v1/user/new?username=#{username}"
		json = JSON.parse(response.body)
		expect(response.status).to eq (200)
		expect(json["name"]).to eq (username)
	end

	it "returns an error for invalid parameters" do

		post "/api/v1/user/new"
		json = JSON.parse(response.body)
		expect(response.status).to eq(400)
	end
end