class CreateTableComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    t.string :body, null: false 
    t.integer :user, null: false 
    t.integer :artwork, null: false 

    t.timestamps
    end
  end
end
