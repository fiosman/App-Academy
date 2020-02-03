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
#

class Post < ApplicationRecord
  validates :title, :author_id, presence: true
  validates :subs, presence: { message: 'must be atleast 1'} 
  
  has_many :post_subs, dependent: :destroy

  has_many :subs, 
    through: :post_subs, 
    source: :sub 

  belongs_to :author, 
    class_name: :User 
  
  has_many :comments

  def comments_by_parent_id 
    comment_ids = {} 

    self.comments.each do |comment| 
      comment_ids[comment.parent_comment_id] = self.comments.where(parent_comment_id: comment.parent_comment_id)
    end

    comment_ids
  end
end 
