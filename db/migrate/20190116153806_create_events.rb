class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :type, null: false
      t.integer :actor_id, null: false
      t.datetime :timestamp, null: false

      t.timestamps
    end
  end
end
