class NotificationMailer < ActionMailer::Base
  default from: "no-reply@brewssterapp.com"

  def comment_added
  	mail(to: "brantwellman@gmail.com",
  		subject: "A comment has been added to your brewery")
  end

end
