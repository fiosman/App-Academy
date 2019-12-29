require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:test_user) { create(:user) }
  subject(:test_goal) { Goal.create!(title: 'blah blah', 
                                     details: 'haha haha', 
                                     user_id: test_user.id
                                     )}
  describe 'GET #new' do 
    it 'renders the new template' do     
      get :new, params: {} 
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #index' do 
    before do    
      allow(controller).to receive(:current_user) { test_user }
    end
    it 'renders the index template' do 
      get :index, params: {} 
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do   
    context 'when the goal exists' do   
      it 'renders the show template for that goal' do   
        get :show, params: { id: test_goal.id } 
        expect(response).to render_template(:show)
      end
    end
    context 'when the goal does not exist' do    
      it 'does not render the show template' do      
        begin
          get :show, params: { id: -1 }
        rescue => exception
          ActiveRecord::RecordNotFound
        end
        expect(response).not_to render_template(:show)
      end
    end
  end

  describe 'GET #edit' do     
    context 'when the exists' do    
      it 'renders the edit template' do    
        get :edit, params: { id: test_goal.id } 
        expect(response).to render_template(:edit)
      end
    end
    context 'when the goal does not exist' do    
      it 'does not render the edit template' do    
        begin
          get :edit, params: { id: -1 } 
        rescue => exception      
          ActiveRecord::RecordNotFound 
        end
        expect(response).not_to render_template(:edit)
      end
    end
  end

  describe 'POST #create' do   

    context 'when logged out' do     
      before do     
        allow(controller).to receive(:current_user) { nil }
      end
      it 'redirects to the login page' do   
        post :create, params: { goal: {} }
        expect(response).to redirect_to(new_session_url)
      end
    end
    context 'when logged in' do  
      before do    
        allow(controller).to receive(:current_user) { test_user } 
      end
      context 'with valid params' do  
        it 'redirects to goal show page' do    
          post :create, params: { goal: { title: 'valid title', 
                                details: 'valid details' } }
          expect(response).to redirect_to(goal_url(Goal.last))
        end
      end 
      context 'with invalid params' do     
        it 'redirects to new goal page' do     
          post :create, params: { goal: { title: nil, details: 'hi'} }
          expect(response).to render_template(:new)
          expect(flash[:errors]).to be_present
        end
      end
    end
  end

  describe 'DELETE #destroy' do    
  end

  describe 'PATCH #update' do    
  end

end
