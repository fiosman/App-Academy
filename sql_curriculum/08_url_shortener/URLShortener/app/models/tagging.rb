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

end
