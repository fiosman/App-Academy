require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(email: 'blah@gmail.com', password: 12345678) }
  
  describe 'validations' do   
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) } 
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe '#is_password?' do   
    context 'when password matches' do 
      it 'returns true' do   
        expect(user.is_password?(12345678)).to be_truthy
      end
    end
    context 'when password doesn\'t match' do   
      it 'returns false' do    
        expect(user.is_password?('1234124122141')).to be_falsy 
      end
    end
  end
end
