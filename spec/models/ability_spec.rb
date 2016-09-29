require 'rails_helper'

describe Ability, :type => :model do
  before do
    @user = (:user)
  end

 it "should return user" do
  expect(:user).to eq @user
 end

end

