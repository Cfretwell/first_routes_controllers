class FixUserTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_tables, :users
  end
end
