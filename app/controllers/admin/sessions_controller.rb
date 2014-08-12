class Admin::SessionsController < ApplicationController
	layout 'admin/login'
	def login
		
	end

	def login_attempt
		 @rro = params[:manager][:manager_name]
		 authorized_user = Admin::Manager.authenticate(params[:manager][:manager_name], params[:manager][:manager_password])
		if authorized_user
			session[:manager_id] = authorized_user.id
			flash[:alert] = "Wow Welcome again, you logged in as #{authorized_user.manager_name}"
			redirect_to(:controller => 'dashboard', :action => 'show')
		else
			flash[:notice] = "Invalid Username or Password #{params[:manager_name]}"
			flash[:color]= "invalid"
			render "login"	
		end
	end

	def logout
		session[:manager_id] = nil
		redirect_to(:controller => 'sessions', :action => 'login')
	end
end
