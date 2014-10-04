class AddProfileIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :profile_id, :integer
    add_index :photos, :profile_id
  end
end
