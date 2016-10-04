require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
   #@user = User.create!(email: "test@test.com", password: "password")
   end

   describe "GET #show" do
     context "User is logged in" do
   	 before do
   	 sign_in @user
   	end
    end
    end

     it "loads correct user details" do
        get :sign_in, id: @users
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
   	 end

   	context "No user is logged in" do
   		it "redirects to login" do
   			get :sign_out, id: @users
   			expect(response).to redirect_to(root_path)
   	end
   	end

end
