# frozen_string_literal: true

namespace :get_actors do
  task from_issue: :environment do
    client = Octokit::Client.new access_token: ENV['GITHUB_ACCESS_TOKEN']

    client.auto_paginate = true
    issues = client.issues 'oss-gate/workshop', state: :all, per_page: 100
    issues.each do |res|
      Actor.create(name: res[:user][:login], icon_url: res[:user][:avatar_url])
    end
  end
end
