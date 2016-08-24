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
    ActionMailer::Base.mail(:from => "admin@newtown.com",
                            :to => user.email,
                            :subject => "Thank you!",
                            :body => "thank you for your purchase").deliver_now
  end
end

