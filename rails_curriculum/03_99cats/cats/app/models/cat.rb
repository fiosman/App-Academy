# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord 
  include ActionView::Helpers::DateHelper 
  
  COLORS = %w(red green blue purple black white).freeze

  validates :birth_date, :name, presence: true 
  validates :color, presence: true, inclusion: { in: COLORS }
  validates :sex, presence: true, inclusion: { in: %w(M F) }

  has_many :rental_requests,
    foreign_key: :cat_id, 
    class_name: :CatRentalRequest, 
    dependent: :destroy

  def age 
    num_years = Date.today.year - self.birth_date.year
    num_months = Date.today.month - self.birth_date.month
    num_days = Date.today.day - self.birth_date.day 

    from_time = Time.now - num_years.years - num_months.months - num_days.days 

    time_ago_in_words(from_time)
  end
end
