require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @user = User.all
   #@user = User.create!(email: "test@test.com", password: "password")
   end

   context "GET #show"
     it "shows correct user details" do
       expect(response).to have_http_status(200)
    end

    context "Post #create"
      it "creates a new user" do
        expect(response).to eq format.html { redirect_to @user, notice: 'User was successfully created.' }
        expect(response).to eq format.json { render :show, status: :created, location: @user }
        expect(response).to eq have_http_status(200)
      it "does not create a new user" do
        expect(response).to eq format.html { render :new }
        expect(response).to eq format.json { render json: @user.errors, status: :unprocessable_entity }
      end
      end


     context "PATCH #update"
       it "updates a new user" do
        expect(response).to eq format.html { redirect_to @user, notice: 'User was successfully updated.' }
        expect(response).to eq format.json { render :show, status: :ok, location: @user }
        expect(response).to have_http_status(200)
       it "does not update a new user" do
        expect(response).to eq format.html { render :edit }
        expect(response).to eq format.json { render json: @user.errors, status: :unprocessable_entity }
      end
      end


      context "DELETE #destroy"
        it "destroys a user" do
          expect(response).to redirect_to users_url, notice: 'User was successfully destroyed.'
          expect(response).to format.json { head :no_content }
          expect(response).to have_http_status(200)
        end

      context private
        it "searches for user" do
          respond_to @user = User.find(params[:id])
          expect(response).to have_http_status(200)
        end

      it "finds user" do
        respond_to require(:user).permit(:first_name, :last_name)
        expect(response).to have_http_status(200)
      end


end
