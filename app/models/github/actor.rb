# frozen_string_literal: true

class Github::Actor < Github::Client
  def self.get
    new.get
  end

  def get
    response = @client.search_issues 'repo:oss-gate/workshop is:issue'

    response.items.each do |res|
      ::Actor.create(name: res[:user][:login], icon_url: res[:user][:avatar_url])
    rescue ActiveRecord::RecordNotUnique => e
      puts e
    end
  end
end
