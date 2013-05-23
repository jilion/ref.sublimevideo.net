namespace :migrate do

  desc "Move contextual and badge counter from referrer to hit"
  task referrer_to_hit: :environment do
    Referrer.where(badge_hits: { :$exists => true }, contextual_hits: { :$exists => true }).all.each do |referrer|
      hit = Hit.where(site_token: referrer.token).first_or_create
      Hit.update_counters(hit.id, contextual: referrer.contextual_hits, badge: referrer.badge_hits)
      referrer.remove_attribute(:contextual_hits)
      referrer.remove_attribute(:badge_hits)
      referrer.save
    end
  end
end
