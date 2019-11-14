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
  validate :does_not_overlap_approved_requests, unless: -> { status == 'DENIED' }

  belongs_to :cat

  def overlapping_requests 
    CatRentalRequest. 
      where.not(id: self.id).
      where(cat_id: self.cat_id). 
      where.not('start_date > :end_date OR end_date < :start_date', 
           start_date: self.start_date, end_date: self.end_date)
  end

  def overlapping_approved_requests 
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_requests 
    return if self.status == 'DENIED'
    
    if overlapping_approved_requests.any?
      errors[:cat] << "request cannot be processed"
    end
  end

  def overlapping_pending_requests 
    overlapping_requests.where(status: 'PENDING')
  end

  def approve!
    CatRentalRequest.transaction do 
      self.status = 'APPROVED'
      self.save!

      overlapping_pending_requests.each do |request| 
        request.status = 'DENIED'
        request.save! 
      end
    end
  end 

  def deny!
    self.status = 'DENIED' 
    self.save!
  end

  def pending? 
    self.status == 'PENDING' 
  end
  
end
