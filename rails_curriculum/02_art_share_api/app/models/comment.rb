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

  has_many :likes, as: :likeable 

  has_many :liked_users, 
    through: :likes, 
    source: :user
end
