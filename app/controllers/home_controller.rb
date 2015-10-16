class HomeController < ApplicationController
	require 'rest-client'

	def index
		@data = RestClient.get 'http://localhost:3000/api/user?token=1' rescue @error = "Unable to Connect"
		if (@data)
			@parse = JSON.parse(@data)
		end
	end
end
