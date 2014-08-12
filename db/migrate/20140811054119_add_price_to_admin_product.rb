class AddPriceToAdminProduct < ActiveRecord::Migration
  def change
    add_column :admin_products, :price, :string
  end
end
