class AddRoleToActor < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :role, :string, null: false
  end
end
