class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user_login!

  def authenticate_user_login!
  	# render 'login/index'
  	  		@logt = session[:user]
  	  		if (request.fullpath != '/logout')
  	if (@logt == nil && request.fullpath != '/login' && request.fullpath !='/signup')
  		redirect_to '/login'
  	elsif (@logt !=nil && request.fullpath != '/')  		
  		redirect_to '/'
  	end
  end
  end
  def current_user
  	
  end
end
