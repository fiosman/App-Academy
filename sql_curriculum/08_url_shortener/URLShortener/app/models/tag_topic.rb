# == Schema Information
#
# Table name: tag_topics
#
#  id         :bigint           not null, primary key
#  topic      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagTopic < ApplicationRecord 
  validates :topic, presence: true, uniqueness: true

  has_many :taggings, 
    primary_key: :id, 
    foreign_key: :tag_topic_id, 
    class_name: :Tagging

  has_many :short_urls, 
    through: :taggings, 
    source: :short_url

  def popular_links 
    short_urls.joins(:visits).
    group(:id).
    order('COUNT(visits.visitor_id) DESC').
    select('short_url, COUNT(visits.visitor_id) AS number_of_visits'). 
    limit(5)
  end
end 
