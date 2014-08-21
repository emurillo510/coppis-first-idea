class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :profile_id

      t.timestamps
    end
    add_index :microposts, [:profile_id, :created_at]
  end
end