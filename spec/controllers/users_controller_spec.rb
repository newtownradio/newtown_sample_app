require 'rails_helper'

describe UsersController, :type => :controller do 
  
  before do
   @user = User.create!(email: "test@test.com", password: "password")
   end

   describe "GET #show" do
     context "User is logged in" do
   	 before sign_in @user 
     it "loads correct user details" do
        get :show, id: @user.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
   	end

   	context "No user is logged in" do
   		it "redirects to login" do
   			get :show, id: @user.id
   			expect(response).to redirect_to(root_path)
   		end
   	end
end

end
