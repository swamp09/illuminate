# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @events = Event.all.limit(30)
  end
end
