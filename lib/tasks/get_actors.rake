require "uri"
require "net/https"
require "json"

namespace :get_actors do
  task :from_issue => :environment do
    def http_get(uri, extra_headers={})
      parsed_uri = URI(uri)
      # if ENV['GITHUB_ACCESS_TOKEN']
      #   extra_headers["Authorization"] = "token #{ENV['GITHUB_ACCESS_TOKEN']}"
      # end
      response = nil
      http = Net::HTTP.new(parsed_uri.host, parsed_uri.port)
      http.use_ssl = parsed_uri.is_a?(URI::HTTPS)
      http.start do |http|
        http_request = Net::HTTP::Get.new(parsed_uri.path, extra_headers)
        response = http.request(http_request)
      end
      response
    end

    response = http_get 'https://api.github.com/repos/oss-gate/workshop/issues?state=all'
    body = JSON.parse(response.body)
    body.map {|res| p res['user']['login']}
  end
end
