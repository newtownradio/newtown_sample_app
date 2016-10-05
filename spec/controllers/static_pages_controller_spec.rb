require 'rails_helper'

describe StaticPagesController, :type => :controller do

  context "def landing_page" do
    before do
      @products = Product.limit(3)
    end
  end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to be_success
    end

#test mailer
  context "def thank_you"
    before do
      @name = params[:name]
      @email = params[:email]
      @message = params[:message]
  it "sends email" do
    expect(response).to eq ActionMailer::Base.mail(:from => @email,
      :to => 'colin.ilgen@gmail.com',
      :subject => "A new contact form message from #{@name}",
      :body => @message).deliver_now
  end
end
end


