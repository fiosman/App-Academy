# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  rating     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#  bench_id   :integer          not null
#
# Indexes
#
#  index_reviews_on_bench_id  (bench_id)
#  index_reviews_on_rating    (rating)
#
class Review < ApplicationRecord 
  validates :bench_id, :body, :rating, presence: { message: 'is required' }
  validates :rating, inclusion: {in: 1..5, message: 'must be between 1 and 5!'}
  
  belongs_to :bench
  belongs_to :author, 
    foreign_key: :author_id, 
    class_name: :User
end
