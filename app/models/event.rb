# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :actor
  self.inheritance_column = :_type_disabled
end
