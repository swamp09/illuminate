# frozen_string_literal: true

class AddTargetUrlToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :target_url, :string
  end
end
