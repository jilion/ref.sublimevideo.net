namespace :migrate do

  desc "Move contextual and badge counter from referrer to hit"
  task referrer_to_hit: :environment do
    Referrer.all.each do |referrer|
      hit = where(site_token: referrer.token).first_or_create
      Hit.update_counters hit.id, contextual: referrer.contextual_hits, badge: referrer.badge_hits
      referrer.remove_attribute(:contextual_hits)
      referrer.remove_attribute(:badge_hits)
    end
  end
end
