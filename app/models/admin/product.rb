class Admin::Product < ActiveRecord::Base
   self.table_name = "admin_products"
  
   validates :name, :presence => true , :length => { :maximum => 50 }
   validates :description, :presence => true
   validates :price, :presence => true , :length => { :maximum => 50 }
   validates :price, :numericality => true, :allow_nil => false  
   validates :height, :presence => true , :length => { :maximum => 50 }
   validates :height, :numericality => true, :allow_nil => false  
   validates :weight, :presence => true , :length => { :maximum => 50 }
   validates :weight, :numericality => true, :allow_nil => false  
   validates :stem, :presence => true , :length => { :maximum => 50 }
   validates :artist, :presence => true , :length => { :maximum => 50 }
   validates :p_image, :presence => true  
   validates :p_image, allow_blank: false, format: { with: %r{\.gif|jpg|png|mp3|epub}i, message: 'must be a gif, jpg, png, mp3 or epub format.'}

   def self.payment(amount,stripe_token )
      customer = Stripe::Customer.create(
          :card  => stripe_token
         )
         charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => amount*100,
          :description => 'Rails Stripe customer',
          :currency    => 'usd'
        )
      rescue Stripe::CardError => e
   end



end
