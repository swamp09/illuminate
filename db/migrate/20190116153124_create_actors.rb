class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :icon_url

      t.timestamps
    end
    add_index :actors, :name, unique: true
  end
end
