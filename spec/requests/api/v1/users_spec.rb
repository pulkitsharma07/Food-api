require 'rails_helper'

describe "User Endpoint", :type => :request do

	it "creates a user" do

		username = "Pulkit"
		post "/api/v1/user/create?username=#{username}"
		json = JSON.parse(response.body)
		expect(response.status).to eq (200)
		expect(json["name"]).to eq (username)
	end

	it "returns an error for invalid parameters" do

		post "/api/v1/user/create"
		json = JSON.parse(response.body)
		expect(response.status).to eq(400)
	end
end