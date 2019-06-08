# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Github::Event, type: :model do
  describe 'eventを保存できる' do
    before do
      VCR.use_cassette('actor_get') do
        Github::Actor.get
      end
      VCR.use_cassette('event_get') do
        Github::Event.get(limit: 10)
      end
    end

    it 'eventが保存されている' do
      expect(Event.all.size).to eq(644)
    end
  end
end
