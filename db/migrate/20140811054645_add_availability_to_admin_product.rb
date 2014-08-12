class AddAvailabilityToAdminProduct < ActiveRecord::Migration
  def change
    add_column :admin_products, :availability, :string
  end
end
