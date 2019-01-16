class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :type, null: false
      t.interger :actor_id, null: false
      t.datetime :timestamp, null: false

      t.timestamps
    end
  end
end
