require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
   #@user = User.create!(email: "test@test.com", password: "password")
   @user2 = FactoryGirl.create(:user)
   end

   describe "GET #show" do
     context "User is logged in" do
   	 before do
   	 sign_in @user
   	end
    end
    end

     it "loads correct user details" do
        get :show, id: @user.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
   	 end

     it "does not load the second user" do
     	get :show, id: @user2.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
     end

   	context "No user is logged in" do
   		it "redirects to login" do
   			get :show, id: @user.id
   			expect(response).to redirect_to (new_user_session_path)
   	end
   	end

end
