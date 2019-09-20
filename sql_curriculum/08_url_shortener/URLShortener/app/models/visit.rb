# == Schema Information
#
# Table name: visits
#
#  id            :bigint           not null, primary key
#  shortened_url :string           not null
#  visitor_id    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Visit < ApplicationRecord 
  validates :shortened_url, :visitor_id, presence: true

  def self.record_visit!(user, shortened_url)
    Visit.create! shortened_url: shortened_url.short_url, visitor_id: user.id
  end
end
