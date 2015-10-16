class HomeController < ApplicationController
	require 'rest-client'

	def index
		@data = RestClient.get 'http://backend-rails.heroku.com/api/user?token=1' rescue @error = "Unable to Connect"
		if (@data)
			@parse = JSON.parse(@data)
		end
	end
end
