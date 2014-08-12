class CreateAdminManagers < ActiveRecord::Migration
  def change
    create_table :admin_managers do |t|
      t.string :manager_email
      t.string :manager_name
      t.string :manager_password
      t.string :manager_role
      t.string :salt

      t.timestamps
    end
  end
end
