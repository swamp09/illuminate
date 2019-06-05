# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Github::Event, type: :model do
  describe 'eventを保存できる' do
    before do
      Actor.create(name: 'swamp09', icon_url: 'test')
      VCR.use_cassette('event_get') do
        Github::Event.get
      end
    end

    it 'eventが保存されている' do
      expect(Event.all.size).to eq(11)
    end
  end
end
