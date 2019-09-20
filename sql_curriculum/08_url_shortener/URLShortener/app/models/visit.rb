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
end
