require 'rails_helper'

describe UserRegistrationsController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
  end

    context "if @user.persisted?"
    it "should welcome user" do
    expect(response).to eq UserMailer.welcome(@user).deliver_now
    expect(response).to eq have_http_status(200)
    end

end
