class ChargesController < ApplicationController
	def create	
		amount = params[:charges].to_i
		stripe_token=params[:stripeToken]
		begin
			Admin::Product.payment(amount,stripe_token)
		rescue Exception => e
		end
		if e.present?
			flash[:error]=e.message
			redirect_to checkout_cart_path
		else
			flash[:success]="Payment Successfull."
			redirect_to root_url
		end
	  		
	end
end
