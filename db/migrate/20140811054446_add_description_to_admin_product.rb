class AddDescriptionToAdminProduct < ActiveRecord::Migration
  def change
    add_column :admin_products, :description, :text
  end
end
