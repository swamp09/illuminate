# frozen_string_literal: true

namespace :get_events do
  task from_actor: :environment do
    client = Octokit::Client.new access_token: ENV['GITHUB_ACCESS_TOKEN']

    client.auto_paginate = true
    actors = Actor.all

    EVENT_LIST = %w[PushEvent CreateEvent IssueEvent PullRequestEvent PullRequestReviewCommentEvent].freeze
    actors.each do |actor|
      response = client.user_public_events actor.name
      response.select { |res| EVENT_LIST.include? res[:type] }.map do |res|
        Event.create(actor_id: actor.id, type: res[:type].downcase, timestamp: res[:created_at], target_url: target_url(res))
      end
    end
  end

  def target_url(res)
    case res[:type]
    when 'PushEvent'
      pp res
      "https://github.com/#{res[:repo][:name]}/commits/#{res[:payload][:commits][0][:sha]}"
    when 'PullRequestEvent'
      res[:payload][:pull_request][:html_url]
    when 'CreateEvent'
      "https://github.com/#{res[:repo][:name]}"
    when 'IssueEvent'
      res[:payload][:issue][:html_url]
    when 'PullRequestReviewCommentEvent'
      binding.pry
      res[:payload][:comment][:html_url]
    end
  end
end
