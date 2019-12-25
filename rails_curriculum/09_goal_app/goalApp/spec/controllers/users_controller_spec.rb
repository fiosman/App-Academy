require 'rails_helper'

RSpec.describe UsersController, type: :controller do  

  describe "POST #create" do   
    context 'when valid params are provided' do   
      it 'redirects user to user show page on success' do 
        post :create, params: { user: { username: 'Christopher', password: 'god12345 ' }}
        expect(response).to redirect_to(user_url(User.last))
      end
    end
    context 'when invalid params are provided' do   
      it 'renders new template if username/password is not provided' do   
        post :create, params: { user: { username: 'Christopher' } }
        expect(flash.now[:errors]).to be_present 
        expect(response).to render_template(:new) 
      end
    end
  end
end
