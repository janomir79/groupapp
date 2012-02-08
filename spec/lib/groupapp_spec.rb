require 'spec_helper'

describe Groupapp do

	include Rack::Test::Methods

	def app
		@app ||= Groupapp.new
	end

	it "should have home page '/'" do
		get '/'
		last_response.should be_ok
	end

	it "is test env '/env'" do
		get '/env'
		last_response.body.should match /test/
	end

end