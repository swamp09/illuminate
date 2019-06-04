# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Github::Actor, type: :model do
  describe 'actorを保存できる' do
    before do
      VCR.use_cassette("actor_get") do
        Github::Actor.get
      end
    end

    it 'actorが保存されている' do
      expect(Actor.all.size).to eq(405)
    end
  end
end
