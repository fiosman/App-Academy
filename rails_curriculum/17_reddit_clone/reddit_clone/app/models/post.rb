# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string           not null
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#  sub_id     :integer          not null
#
# Indexes
#
#  index_posts_on_sub_id_and_author_id  (sub_id,author_id)
#

class Post < ApplicationRecord
  validates :title, :sub_id, :author_id, presence: true

  belongs_to :sub
  belongs_to :author, 
    class_name: :User
end 
