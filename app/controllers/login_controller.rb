class LoginController < ApplicationController
	#welcome
require 'rest-client'
	def index
		if (params[:email] == "" || params[:password] == "")
			@error = "Please Fill All the fields"
			return
		end
		if (params[:email] != nil)
			@error = params
		 @success = RestClient.post "http://localhost:3000/api/login",{:token=>"1",:email => params[:email],:password=>params[:password]} rescue @error = "Invalid Login Information"
	end
	if (@success)
		redirect_to '/'
		session[:user] = JSON.parse @success
	end
	end
	def logout
		reset_session
		redirect_to '/'
	end
end
