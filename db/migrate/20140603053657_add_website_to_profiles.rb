class AddWebsiteToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :name, :string
    add_column :profiles, :website, :string
    add_column :profiles, :location, :string
    add_column :profiles, :what_we_make, :string
    add_column :profiles, :brands_we_carry, :string
    add_column :profiles, :description, :string
    add_column :profiles, :is_brand, :boolean, default: true
  end
end
