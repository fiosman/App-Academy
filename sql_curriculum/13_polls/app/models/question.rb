# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord 
  validates :question, :poll_id, presence: true

  has_many :answer_choices, 
    primary_key: :id, 
    foreign_key: :question_id, 
    class_name: :AnswerChoice

  belongs_to :poll, 
    primary_key: :id, 
    foreign_key: :poll_id, 
    class_name: :Poll 

  has_many :responses, 
    through: :answer_choices, 
    source: :responses

  def results 
   poll_results = {}
   answer_choices = self.answer_choices.includes(:responses)

    answer_choices.each do |answer_choice| 
     poll_results[answer_choice.answer_choice] = answer_choice.responses.length
    end

   poll_results
  end

end
