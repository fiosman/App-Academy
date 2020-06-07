# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  body       :string           not null
#  done       :boolean          default(FALSE)
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Todo < ApplicationRecord 
  validates :title, :body, presence: true
  validates :done, inclusion: { in: [true, false] }

  has_many :steps
  belongs_to :user
end
