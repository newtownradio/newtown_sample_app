class UserMailer < ApplicationMailer
  default from: "from@example.com"

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

def thank_you(user)
  UserMailer.contact_form(user.name, user.email, "Thank you!").deliver_now
end

end
