# frozen_string_literal: true

class Github::Actor < Github::Client
  def self.get(date: nil)
    new.get(date)
  end

  def get(date)
    if date
      response = @client.search_issues "repo:oss-gate/workshop is:issue created: #{date.to_s}"
    else
      response = @client.search_issues 'repo:oss-gate/workshop is:issue'
    end

    response.items.each do |res|
      ::Actor.create(name: res[:user][:login], icon_url: res[:user][:avatar_url])
    rescue ActiveRecord::RecordNotUnique => e
      puts e
    end
  end
end
