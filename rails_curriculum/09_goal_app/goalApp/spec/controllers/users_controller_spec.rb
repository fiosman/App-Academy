require 'rails_helper'

RSpec.describe UsersController, type: :controller do  

  describe "POST #create" do   
    context "when valid params are provided" do   
      it "redirects user to user show page on success" do 
        post :create, params: { user: { username: 'Christopher', password: 'god12345 ' }}
        expect(response).to redirect_to(user_url(User.last))
      end
    end
    context "when invalid params are provided" do   
      it "renders new template if username/password is not provided" do   
        post :create, params: { user: { username: 'Christopher' } }
        expect(flash.now[:errors]).to be_present 
        expect(response).to render_template(:new) 
      end
    end
  end

  describe "GET #new" do    
    it "renders the new template" do   
      get :new, params: {}
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do    
    context "if the user exists" do 
      it "renders the user's show template" do 
        user = User.create!(username: 'Christopher', password: 'god12345') 
        get :show, params: { id: User.last.id } 
        expect(response).to render_template(:show)
      end
    end
    context "if the user doesn't exist" do    
      it "does not render the show template" do    
        begin
          get :show, params: { id: -1 }
        rescue => exception 
          ActiveRecord::RecordNotFound
        end
        expect(response).not_to render_template(:show)
      end
    end
  end
end
