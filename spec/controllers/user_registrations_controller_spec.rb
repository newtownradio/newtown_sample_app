require 'rails_helper'

describe UserRegistrationsController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
  end

  describe super do
    context "if @user.persisted?" do
    get UserMailer.welcome(@user).deliver_now
    expect(response).to eq have_http_status(200)
    end
  end

end
