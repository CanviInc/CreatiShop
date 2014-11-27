class Admin::ManagersController < ApplicationController
	layout 'admin/admin'
	before_filter :authenticate_user
	def show
		
	end

	def new
		@manager = Admin::Manager.new	
	end


	def create
		 @manager = Admin::Manager.new(manager_params)
	     if @manager.save   
	       flash[:alert] = "User is successfully Created"
	       redirect_to admin_dashboard_index_path
	     else
	       flash[:alert] = @manager.errors.full_messages.join("<br/>").gsub("Manager", "User")
	       redirect_to :back
	     end
	end
	def edit
		@manager = Admin::Manager.find_by_id(1)
	end

	def update
	  @passwrd = Digest::SHA2.hexdigest(params[:manager][:manager_password]); 
	  @updat = Admin::Manager.where(id: 1).update_all(manager_email: params[:manager][:manager_email], manager_name: params[:manager][:manager_name], manager_password: @passwrd)
	  if @updat 		  
	     redirect_to admin_dashboard_index_path, :flash => { :alert => "Profile Updated Successfully" }	
	  else
	  	  render 'edit'	
	  end

	end

	private

	  def manager_params
	    params.require(:manager).permit(:manager_email, :manager_name, :manager_password)
	  end
end
