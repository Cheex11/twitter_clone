class TweetMailer < ActionMailer::Base
  default from: "David@example.com"

  def notify_user(receiver, sender)
    @receiver = receiver
    @sender = sender
    mail to: @receiver.email, subject: "You were mentioned in a tweet!"
  end
end
