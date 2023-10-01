class CreateSignups < ActiveRecord::Migration[7.0]
  def change
    create_table :signups do |t|
      t.references :attendee, null: false, foreign_key: {to_table: :users}
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
