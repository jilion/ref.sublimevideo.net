class Referrer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :token
  field :url
  field :hits,            type: Integer, default: 0
  field :badge_hits,      type: Integer, default: 0
  field :contextual_hits, type: Integer, default: 0

  # =================
  # = Class Methods =
  # =================

  # def self.create_or_update_from_type(token, url, type='c')
  #   if referrer = Referrer.where(url: url, token: token).first
  #     case type
  #     when 'b'
  #       referrer.badge_hits = referrer.badge_hits.to_i + 1
  #     when 'c'
  #       referrer.contextual_hits = referrer.contextual_hits.to_i + 1
  #     end
  #     referrer.save
  #   else
  #     create(
  #       url:             url,
  #       token:           token,
  #       badge_hits:      (type == 'b' ? 1 : 0),
  #       contextual_hits: (type == 'c' ? 1 : 0)
  #     )
  #   end
  # end

end
