# frozen_string_literal: true

class Github::Client
  def initialize
    @client = Octokit::Client.new access_token: ENV['GITHUB_ACCESS_TOKEN']
    @client.auto_paginate = true
  end
end
