require 'spec_helper'

describe Tweet do
  it { should belong_to :user }
  it { should validate_presence_of :text }
  it { should ensure_length_of(:text).is_at_most(140)   }

  it 'sends an email when a user is mentioned in another users tweet' do
    user = User.create(name: "David", password: "1234", password_confirmation: "1234", email: "x@example.com")
    user1 = User.create(name: "Dan", password: "4321", password_confirmation: "4321", email: "xx@example.com")
    tweet = Tweet.new(text: "@David is mentioned in this tweet", user_id: user1.id)
    expect(TweetMailer).to receive(:notify_user).with(user, user1)
    tweet.save
  end
end
