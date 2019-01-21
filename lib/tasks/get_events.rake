require "uri"
require "net/https"
require "json"

namespace :get_events do
  task :from_actor => :environment do
    def http_get(uri, extra_headers={})
      parsed_uri = URI(uri)
      response = nil
      http = Net::HTTP.new(parsed_uri.host, parsed_uri.port)
      http.use_ssl = parsed_uri.is_a?(URI::HTTPS)
      http.start do |http|
        http_request = Net::HTTP::Get.new(parsed_uri.path, extra_headers)
        response = http.request(http_request)
      end
      response
    end
    actor = 'swamp09'
    EVENT_LIST = ['PushEvent', 'CreateEvent', 'IssuesEvent', 'IssueCommentEvent', 'PullRequestEvent', 'PullRequestReviewEvent', 'ForkEvent']
    response = http_get "https://api.github.com/users/#{actor}/events"
    body = JSON.parse(response.body)
    puts body.select { |res| EVENT_LIST.include? res['type'] }
  end
end
