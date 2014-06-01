class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :website, :string
    add_column :users, :is_brand, :boolean, default: false

  end
end
