class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :text, presence: true, length: { in: 1..140 }
end
