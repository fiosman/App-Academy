require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe 'validations' do    
    it { should validate_presence_of(:details) }
    it { should validate_presence_of(:title) }
  end

  describe 'associations do' do 
    it { should belong_to(:user) } 
    it { should have_many(:comments) }
  end
end
