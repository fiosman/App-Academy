# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  body       :string           not null
#  done       :boolean          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Todo < ApplicationRecord 
  validates :title, :body, presence: true
  validates :done, inclusion: { in: [true, false] }
  
end
