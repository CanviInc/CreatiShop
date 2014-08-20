class Books < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
		t.column :name, :string, :limit => 1000, :null => false
		t.column :p_image, :string, :limit => 1000, :null => false
		t.column :catagory, :string, :limit => 1000, :null => false
		t.column :price, :string, :limit => 1000, :null => false
		t.column :availability, :string, :limit => 1000, :null => false
		t.column :height, :string, :limit => 1000, :null => false
		t.column :weight, :string, :limit => 1000, :null => false
		t.column :stem, :string, :limit => 1000, :null => false
		t.column :artist, :string, :limit => 1000, :null => false
		t.column :description, :text
		t.column :created_at, :timestamp
		t.column :updated_at, :timestamp
     end
  end

  def self.down
    drop_table :products
  end
end
