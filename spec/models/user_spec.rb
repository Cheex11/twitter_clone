require 'spec_helper'

describe User do
  before(:each) do
    FactoryGirl.build(:user)
  end
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :password_digest }
  it { should have_many :tweets }

  it 'sends a welcome email' do
    user = User.new(name: "David", password: "1234", password_confirmation: "1234", email: "x@example.com")
    expect(UserMailer).to receive(:signup_confirmation).with(user)
    user.save
  end
end
