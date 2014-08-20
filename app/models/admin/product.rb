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
   validates :p_image, allow_blank: false, format: { with: %r{\.gif|jpg|png}i, message: 'must be a gif, jpg, or png image.'}


end
