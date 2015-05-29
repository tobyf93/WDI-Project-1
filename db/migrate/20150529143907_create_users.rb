class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.boolean :admin, :default => false
      t.string :avatar
      t.boolean :use_geoloc, :default => true
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
