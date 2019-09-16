# == Schema Information
#
# Table name: houses
#
#  id      :bigint           not null, primary key
#  address :text             not null
#

class House < ApplicationRecord 
  validates :address, presence: true
  
  has_many :residents, 
    primary_key: :id,
    foreign_key: :house_id, 
    class_name: :Person
end
