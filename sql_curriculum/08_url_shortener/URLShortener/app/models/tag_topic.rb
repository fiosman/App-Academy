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
end 
