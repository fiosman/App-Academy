# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer          not null
#
# Indexes
#
#  index_subs_on_author_id  (author_id) UNIQUE
#  index_subs_on_title      (title) UNIQUE
#

class Sub < ApplicationRecord 

end 
