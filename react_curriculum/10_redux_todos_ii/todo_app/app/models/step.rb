# == Schema Information
#
# Table name: steps
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  done       :boolean          default(FALSE)
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  todo_id    :integer          not null
#
# Indexes
#
#  index_steps_on_todo_id  (todo_id)
#

class Step < ApplicationRecord 
  validates :body, :title, :todo_id, presence: true 
  validates :done, inclusion: { in: [true, false] }, default: false 

  belongs_to :todo
end
