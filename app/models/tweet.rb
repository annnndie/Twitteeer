class Tweet < ApplicationRecord
  acts_as_paranoid
  validates :content, presence: true,
                      length: { maximum: 280 }
  # relation
  belongs_to :user
  has_many :likes
  has_many :like_tweet_users, class_name: "User", through: :likes, source: :user

  def owned_by(u) 
    u === self.user
  end

  def like_by(u)
    u.i_like_tweets.where(id: self.id).exists?
  end

end
