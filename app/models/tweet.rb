class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :text, presence: true, length: { in: 1..140 }
  after_create :notify_user

  private
  def notify_user
    if self.text.scan(/(?<!\w)@(\w+)/) != []
      names_to_notify = text.scan(/(?<!\w)@(\w+)/)

      names_to_notify.each do |name|
        found = User.find_by(name: name)
        TweetMailer.notify_user(found, self.user)
      end
    end
  end
end
