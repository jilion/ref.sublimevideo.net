class Hit < ActiveRecord::Base
  validates :site_token, presence: true, uniqueness: true

  def self.increment(attributes)
    hit = where(site_token: attributes['site_token']).first_or_create
    hit.increment!(_counter_from_type(attributes['type']))
  end

  private

  def self._counter_from_type(type)
    case type
    when 'b' then :badge
    when 'c' then :contextual
    end
  end
end

# == Schema Information
#
# Table name: hits
#
#  badge      :integer          default(0)
#  contextual :integer          default(0)
#  created_at :datetime
#  id         :integer          not null, primary key
#  site_token :string(255)
#  updated_at :datetime
#
# Indexes
#
#  index_hits_on_site_token  (site_token) UNIQUE
#

