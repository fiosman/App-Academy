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
  validates :status, presence: true, inclusion: { in: %w(PENDING APPROVED DENIED).freeze }
  validate :does_not_overlap_approved_requests

  belongs_to :cat

  def overlapping_requests 
    CatRentalRequest. 
      where.not(id: self.id).
      where(cat_id: self.cat_id). 
      where('start_date > :start_date AND end_date > :end_date', 
           start_date: self.start_date, end_date: self.end_date)
  end

  def overlapping_approved_requests 
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_requests 
    if !overlapping_approved_requests.empty? 
      errors[:request] << 'cannot be processed as this cat cannot be rented'
    end
  end

end
