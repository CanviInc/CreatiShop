class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
	def authenticate_user
		if session[:manager_id]
			# set current user object to @current_user object variable
			@current_manager = Admin::Manager.find session[:manager_id]
			return true	
			exit
		else  
			redirect_to(:controller => 'sessions', :action => 'login')
			return false
		end
	end
	def save_login_state
		if session[:manager_id]
			redirect_to(:controller => 'dashboard', :action => 'show')
			return false
		else
			return true
		end
	end
end
