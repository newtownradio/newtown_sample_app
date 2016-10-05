require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @user = User.all
   #@user = User.create!(email: "test@test.com", password: "password")
   end

   describe "GET #show" do
    end

    context "Get #{new}" do
      @user = User.new
    end

    context "Get #{edit}" do
    end

    context "Post #{create}" do
      it @user = User.new(user_params)
      it respond_to do |format|
      if @user.save
        expect(response).to eq format.html { redirect_to @user, notice: 'User was successfully created.' }
        expect(response).to eq format.json { render :show, status: :created, location: @user }
      else
        expect(response).to eq format.html { render :new }
        expect(response).to eq format.json { render json: @user.errors, status: :unprocessable_entity }
      end
      end
      end

     context "PATCH #{update}" do
     it respond_to do |format|
      if @user.update(user_params)
        expect(response).to eq format.html { redirect_to @user, notice: 'User was successfully updated.' }
        expect(response).to eq format.json { render :show, status: :ok, location: @user }
      else
        expect(response).to eq format.html { render :edit }
        expect(response).to eq format.json { render json: @user.errors, status: :unprocessable_entity }
      end
      end
      end

      context "DELETE #{destroy}" do
      it @user.destroy
      expect respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
      end
      end

      context private
      it set_user do
      expect(response).to @user = User.find(params[:id])
      end

      it user_params
      expect(response).to eq params.require(:user).permit(:first_name, :last_name)
      end

    end


