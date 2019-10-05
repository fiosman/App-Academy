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
end
