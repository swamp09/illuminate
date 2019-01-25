# frozen_string_literal: true

namespace :get_actors do
  task from_issue: :environment do
    client = Octokit::Client.new access_token: ENV['GITHUB_ACCESS_TOKEN']

    client.auto_paginate = true
    response = client.search_issues 'repo:oss-gate/workshop is:issue'

    response.items.each do |res|
      Actor.create(name: res[:user][:login], icon_url: res[:user][:avatar_url])

    rescue ActiveRecord::RecordNotUnique => e
      puts e
    end
  end
end
