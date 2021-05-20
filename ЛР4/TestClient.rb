require_relative 'Client'

class TestClient

	attr_accessor :test_client

	def initialize
		@test_client = Client.new
	end

	def self.create_client(name, birth_date, phone_number, email, address)
		Client.new(name, birth_date, phone_number, email, address)
	end

	def test_name(name)
		begin
			@test_client.name = name
		rescue Exception => e
			puts e.message
		end
	end

	def test_birth_date(birth_date)
		begin
			@test_client.birth_date = birth_date
		rescue Exception => e
			puts e.message
		end
	end

	def test_phone_number(phone_number)
		begin
			@test_client.phone_number = phone_number
		rescue Exception => e
			puts e.message
		end
	end

	def test_email(email)
		begin
			@test_client.email = email
		rescue Exception => e
			puts e.message
		end
	end

end