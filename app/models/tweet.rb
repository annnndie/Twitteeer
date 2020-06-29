class Tweet < ApplicationRecord
  acts_as_paranoid
  validates :content, presence: true,
                      length: { maximum: 280 }
  # relation
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes

  def owned_by(u) 
    u === self.user
  end

  def like_by(u)
    u.tweets.include?(self)
  end

end
