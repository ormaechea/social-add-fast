class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :name
      t.string :username
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
