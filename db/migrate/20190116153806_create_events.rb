class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :type
      t.interger :actor_id
      t.datetime :timestamp

      t.timestamps
    end
  end
end
