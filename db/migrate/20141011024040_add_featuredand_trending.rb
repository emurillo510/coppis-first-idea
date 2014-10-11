class AddFeaturedandTrending < ActiveRecord::Migration
  def change
   
     add_column :profiles, :featured, :boolean
     add_column :profiles, :trending, :boolean

  end
end
