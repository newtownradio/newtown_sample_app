require 'rails_helper'

describe ApplicationController, :type => :controller do

before do
  protect_from_forgery with: :null_session
end

context "GET #{:show}"
  it "rescue_from CanCan::AccessDenied" do
  expect(response).to redirect_to main_app.root_url, :alert => exception.message
end
end
