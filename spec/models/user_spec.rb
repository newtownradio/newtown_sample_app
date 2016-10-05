require "rails_helper"

describe User, :type => :model do
  context "not_an_email"
    @user = FactoryGirl.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end
end
