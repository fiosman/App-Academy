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
end
