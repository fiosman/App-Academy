class PostSub < ApplicationRecord 
  validates :post_id, :sub_id, presence: true 
  
  belongs_to :post 
  belongs_to :sub 
end 