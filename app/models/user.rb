class User < ActiveRecord::Base
	before_create :create_api_key

	has_many :orders, dependent: :destroy

	private
	def create_api_key
		begin
			self.api_key = SecureRandom.hex.to_s
		end while self.class.exists?(api_key: api_key)
	end
end
