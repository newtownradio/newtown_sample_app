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

def thank_you
   @name = params[:name]
   @email = params[:email]
   @message = params[:message]
     UserMailer.contact_form(@email, @name, @message).deliver_now
     post '/contact_form', to: redirect('/static_pages/thank_you')
 end
 end