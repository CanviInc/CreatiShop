require 'digest'

class Admin::Manager < ActiveRecord::Base
  self.table_name = "admin_managers"
  #attr_accessible :manager_email, :manager_name, :manager_password, :manager_role, :salt

  validates :manager_name, :presence => true , :length => { :maximum => 50 } 
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :manager_email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }  
  validates :manager_password, :presence => true, :confirmation => true, :length => {:within => 6..40}

  before_save :encrypt_password

  def self.authenticate(username_or_email="", login_password="")    
      manager = Admin::Manager.find_by_manager_name(username_or_email)

    if manager && manager.manager_password == Digest::SHA2.hexdigest(login_password)
      return manager
    else
      return false
    end
  end

  def match_password(login_password="")
    encrypted_password == secure_hash(login_password)
  end

   
      def encrypt_password      	 
         self.manager_password = secure_hash(manager_password)
      end
     
      def secure_hash(string)
        Digest::SHA2.hexdigest(string)
      end 
end
