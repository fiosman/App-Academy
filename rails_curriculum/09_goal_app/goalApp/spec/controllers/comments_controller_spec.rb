require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:test_user) { create(:user) } 
  let!(:test_goal) { create(:goal, user_id: test_user.id) }

  describe 'POST #create' do    
    context 'when logged out' do    
      before do    
        allow(controller).to receive(:current_user) { nil } 
      end
      it 'redirects to login page' do    
        post :create, params: { comment: {} } 
        expect(response).to redirect_to(new_session_url) 
      end
    end
    context 'when logged in' do    
      before do     
        allow(controller).to receive(:current_user) { test_user }
      end
      context 'with valid params' do  
        it 'notifies user that comment has been saved upon successful creation' do        
          post :create, params: { comment: { comment: 'Nice stuff', 
                                         commentable: test_user, 
                                         author_id: test_user.id } }
          expect(flash[:notices]).to match('Comment saved') 
        end
      end
      context 'with invalid params' do     
        it 'displays error and does not create comment' do    
          post :create, params: { comment: { comment: nil } }
          expect(flash[:errors]).to be_present 
        end
      end
    end 
  end
end