class StaticPagesController < ApplicationController
  def landing_page
    @products = Product.limit(3)
  end
  def index
  end
  def about
  end
  def contact 
  end
  def featured
  end
  def calendar
  end
end

def thank_you
   @name = params[:name]
   @email = params[:email]
   @message = params[:message]
     ActionMailer::Base.mail(:from => @email,
       :to => 'colin.ilgen@gmail.com',
       :subject => "A new contact form message from #{@name}",
       :body => @message).deliver
 end