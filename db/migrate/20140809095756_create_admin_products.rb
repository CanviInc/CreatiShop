class CreateAdminProducts < ActiveRecord::Migration
  def change
    create_table :admin_products do |t|
      t.string :name
      t.string :p_image
      t.string :catagory

      t.timestamps
    end
  end
end
