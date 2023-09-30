class RemoveWrongForeignKeyAndColumnAgain < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :events, :users
    remove_column :events, :user_id
  end
end
