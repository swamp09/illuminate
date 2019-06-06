# frozen_string_literal: true

class Github::Event < Github::Client
  EVENT_LIST = %w[PushEvent CreateEvent IssueEvent PullRequestEvent PullRequestReviewCommentEvent].freeze

  def self.get(limit: 50, offset: 0)
    new.get(limit, offset)
  end

  def get(limit, offset)
    actors = ::Actor.all.limit(limit).offset(offset)

    actors.each do |actor|
      response = @client.user_public_events actor.name
      response.select { |res| EVENT_LIST.include? res[:type] }.map do |res|
        target_url = target_url(res)

        next if target_url.blank?

        ::Event.create(actor_id: actor.id, type: res[:type].downcase, timestamp: res[:created_at], target_url: target_url)
      end
    end
  end

  private

  def target_url(res)
    case res[:type]
    when 'PushEvent'
      "https://github.com/#{res[:repo][:name]}/commit/#{res[:payload][:commits]&.first&.[](:sha)}"
    when 'PullRequestEvent'
      res[:payload][:pull_request][:html_url]
    when 'CreateEvent'
      "https://github.com/#{res[:repo][:name]}"
    when 'IssueEvent'
      res[:payload][:issue][:html_url]
    when 'PullRequestReviewCommentEvent'
      res[:payload][:comment][:html_url]
    end
  end
end
