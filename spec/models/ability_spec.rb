require 'rails_helper'

describe Ability, :type => :model do

  before do
    @user = FactoryGirl.create(:user, orders: @orders, product: @product)
    end

    it "initializes new user" do
      respond_to User.new
      expect(response).to eq can :manage, User, id: user.id
      expect(response).to have_http_status(200)
    end

    it "can manage all" do
      respond_to if user.admin?
      expect(response).to eq can :manage, :all
      expect(response).to have_http_status(200)
    end

    it "cannot manage all" do
      respond_to can :manage, User, id: user.id
      expect(response).to have_http_status(200)
    end
end

