require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  
  describe 'GET #new' do 
    it 'renders the new template' do     
      get :new, params: {} 
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #index' do    
  end

  describe 'GET #show' do   
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
