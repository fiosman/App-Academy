# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  artwork_id   :integer          not null
#  comment_body :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ApplicationRecord 

  belongs_to :author, 
    foreign_key: :user_id, 
    class_name: :User

  belongs_to :artwork
end
