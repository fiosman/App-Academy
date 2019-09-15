# == Schema Information
#
# Table name: houses
#
#  id      :bigint           not null, primary key
#  address :text             not null
#

class House < ApplicationRecord 
  validates :address, presence: true
end
