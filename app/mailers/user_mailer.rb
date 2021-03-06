class UserMailer < ApplicationMailer
  default from: "contact@newtownradio.com"

def contact_form(email, name, message)
  @message = message
mail(:from => email,
    :to => 'colin.ilgen@gmail.com',
    :subject => "A new contact form message from #{name}")
end

def welcome(user)
	@appname = "Newtown Radio"
	mail(:to => user.email,
		 :subject => "Welcome to #{@appname}!")
end

def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  UserMailer.contact_form(@name, @email, @message).deliver_now

end

def payments_email(customer)
  @customer = customer
  mail(:to => @customer.email, :subject => "Payment Confirmation")
end

end
