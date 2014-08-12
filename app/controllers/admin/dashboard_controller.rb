class Admin::DashboardController < ApplicationController
	layout 'admin/admin'
	before_filter :authenticate_user
	def show
	end
	def index
		render 'show'
	end
end
