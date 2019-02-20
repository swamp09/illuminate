# frozen_string_literal: true

namespace :get_events do
  task from_actor: :environment do
    client = Octokit::Client.new access_token: ENV['GITHUB_ACCESS_TOKEN']

    client.auto_paginate = true
    actors = Actor.all

    EVENT_LIST = %w[PushEvent CreateEvent IssuesEvent PullRequestEvent PullRequestReviewEvent].freeze
    actors.each do |actor|
      response = client.user_public_events actor.name
      response.select { |res| EVENT_LIST.include? res[:type] }.map do |res|
        Event.create(actor_id: actor.id, type: res[:type].downcase, timestamp: res[:created_at])
      end
    end
  end
end
