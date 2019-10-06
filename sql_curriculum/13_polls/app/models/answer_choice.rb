# == Schema Information
#
# Table name: answer_choices
#
#  id            :integer          not null, primary key
#  answer_choice :text             not null
#  question_id   :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class AnswerChoice < ApplicationRecord 
  validates :answer_choice, :question_id, presence: true

  belongs_to :question, 
    primary_key: :id, 
    foreign_key: :question_id, 
    class: :Question 
    
  has_many :responses, 
    primary_key: :id, 
    foreign_key: :answer_choice_id, 
    class: :Response 
end
