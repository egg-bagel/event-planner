class TryAddingForeignKeyAgain < ActiveRecord::Migration[7.0]
  def change
    change_table :events do |t|
      t.references :creator, null: false, foreign_key: {to_table: :users}
    end
  end
end
