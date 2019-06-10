namespace :actor_get do
  desc "Actorの本日分の差分の保存"
  task today: :environment do
    Github::Actor.get(date: Time.zone.today)
  end
end
