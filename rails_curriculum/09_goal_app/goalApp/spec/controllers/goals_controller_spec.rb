require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  
  describe 'GET #new' do 
    it 'renders the new template' do     
      get :new, params: {} 
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #index' do 
    it 'renders the index template' do    
      get :index, params: {} 
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do   
    context 'when the goal exists' do   
      let(:goal) { Goal.create!(title: 'blah blah', details: 'haha haha' }  
      it 'renders the show template for that goal' do   
        get :show, params: { id: goal.id } 
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
  end

  describe 'POST #create' do    
  end

  describe 'DELETE #destroy' do    
  end

  describe 'PATCH #update' do    
  end

end
