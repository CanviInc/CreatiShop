class AddDetailsToAdminProducts < ActiveRecord::Migration
  def change
    add_column :admin_products, :height, :float
    add_column :admin_products, :weight, :float
    add_column :admin_products, :stem, :string
    add_column :admin_products, :artist, :string
  end
end
