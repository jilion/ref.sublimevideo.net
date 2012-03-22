class Referrer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :token
  field :url
  field :hits,            type: Integer, defautl: 0
  field :badge_hits,      type: Integer, defautl: 0
  field :contextual_hits, type: Integer, defautl: 0

  index [[:token, Mongo::ASCENDING], [:url, Mongo::ASCENDING]]

  attr_accessible :token, :url, :hits, :contextual_hits, :badge_hits

  # ===============
  # = Validations =
  # ===============

  validates :token, presence: true
  validates :url,   presence: true, format: { with: /^https?\:\/\/.*/ }

  # =================
  # = Class Methods =
  # =================

  def self.create_or_update_from_type(token, url, type='c')
    if referrer = Referrer.where(url: url, token: token).first
      case type
      when 'b'
        referrer.badge_hits = referrer.badge_hits.to_i + 1
      when 'c'
        referrer.contextual_hits = referrer.contextual_hits.to_i + 1
      end
      referrer.save
    else
      create(
        url:             url,
        token:           token,
        badge_hits:      (type == 'b' ? 1 : 0),
        contextual_hits: (type == 'c' ? 1 : 0)
      )
    end
  end

end
