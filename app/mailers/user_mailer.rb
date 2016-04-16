class UserMailer < ApplicationMailer
  default from: "from@example.com"

def contact_form(email, name, message)
 @message = message
 mail(:from => email,
     :to => 'colin.ilgen@gmail.com',
     :subject => "A new contact form message from #{name}")
end

def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  UserMailer.contact_form(@name, @email, @message).deliver
end

end