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

  describe '#is_password?' do    
    context 'when password matches to password digest' do   
      it 'returns true'  do   
        expect(user.is_password?('123456')).to eq(true)  
      end
    end
    context 'when password does not match to password digest' do   
      it 'returns false' do    
        expect(user.is_password?('')).to eq(false)
      end
    end
  end

  describe "#reset_session_token!" do   
    it 'resets a user\'s session token' do    
      old_token = user.session_token   
      new_token = user.reset_session_token! 
      expect(old_token).not_to eq(new_token)
    end
    it 'should save the session token in the database' do    
      expect(user).to receive(:save!)
      user.reset_session_token! 
    end 
    it 'should return the new session token' do    
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end
end
