class AddClIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :cl_id, :string
  end
end
