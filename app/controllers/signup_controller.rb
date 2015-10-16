class SignupController < ApplicationController

def index
		if (params[:email] == "" || params[:password] == "" || params[:name] == "")
			@error = "Please Fill All the fields"
			return
		end
		if (params[:email] != nil)
			@error = params
		 @success = RestClient.post "http://localhost:3000/api/user",{:token=>"1",:email => params[:email],:password=>params[:password],:name=>params[:name]} rescue @error = "Invalid Login Information"
	end
	if (@success)
		# 
		@check =JSON.parse @success
		if (@check["id"] == nil)
			@error = "Invalid Signup Information"
		else
			redirect_to '/'
		end
	end
	end
end
