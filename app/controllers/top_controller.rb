# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @events = Event.includes(:actor).order(timestamp: :DESC)
  end
end
