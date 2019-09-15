# == Schema Information
#
# Table name: people
#
#  id       :bigint           not null, primary key
#  name     :string           not null
#  house_id :integer          not null
#

class Person < ApplicationRecord 
  validates :name, :house_id, presence: true
end
