class AddRepositoryNameToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :repositry_name, :string, null: false
  end
end
