class Admin::Product < ActiveRecord::Base

   validates :catagory, :presence => true , :length => { :maximum => 50 } 
   validates :name, :presence => true , :length => { :maximum => 50 }
   validates :description, :presence => true
   validates :price, :presence => true , :length => { :maximum => 50 }
   validates :price, :numericality => true, :allow_nil => false  
   validates :availability, :presence => true , :length => { :maximum => 50 }
   validates :p_image, :presence => true  
   validates :p_image, allow_blank: false, format: { with: %r{\.gif|jpg|png}i, message: 'must be a gif, jpg, or png image.'}


end
