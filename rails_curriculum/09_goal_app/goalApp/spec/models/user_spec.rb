require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(username: 'fares', password: '123456') }

  describe 'validations' do  
    it { should validate_presence_of(:username) }  
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) } 
    it { should validate_length_of(:password).is_at_least(6) }
  end

  it 'creates a password digest' do   
    expect(user.password_digest).to_not be_nil 
  end

  it 'ensures a session token is assigned' do   
    expect(user.session_token).to_not be nil   
    expect(user.valid?).to be_truthy
  end 

  describe '::generate_session_token' do   
    it 'creates a session token' do   
      expect(User.generate_session_token.bytesize).to eq(22)
    end
  end
end
