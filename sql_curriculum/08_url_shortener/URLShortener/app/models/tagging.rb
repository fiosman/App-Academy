# == Schema Information
#
# Table name: taggings
#
#  id           :bigint           not null, primary key
#  url_id       :integer          not null
#  tag_topic_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Tagging < ApplicationRecord 
  validates :url_id, :tag_topic_id, presence: true

  belongs_to :short_url, 
    primary_key: :id, 
    foreign_key: :url_id, 
    class_name: :ShortURL

  belongs_to :tag_topic, 
    primary_key: :id, 
    foreign_key: :tag_topic_id, 
    class_name: :TagTopic
end
