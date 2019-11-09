# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord 
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(PENDING APPROVED DENIED) }

  belongs_to :cat

  def overlapping_requests 
    CatRentalRequest.where(id: 4)
  end
end

#A cat rental request starting on 02/25/17 and ending on 02/27/17.
#There is a overlap if another cat rental also starts on the same day (02/25/17).
#There is a overlap if another cat rental request starts on the return day (02/27/17).
#There is a overlap if another cat rental request starts between the start and end dates (02/26/17).
