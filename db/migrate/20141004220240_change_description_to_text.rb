class ChangeDescriptionToText < ActiveRecord::Migration
  def change
     change_column :profiles, :description, :text, :limit => 65535
  end
end
