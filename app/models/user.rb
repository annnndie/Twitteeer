class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :account, presence: true,
                      uniqueness: true, 
                      length: { minimum: 4, maximum: 15 },
                      format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :nickname, presence: true,
                       length: { maximum: 50 }

  # relation
  has_many :tweets
  # 資料來源：https://dev.to/knheidorn/rails-crash-course-building-follower-following-relationship-4kjl
  has_many :active_relationships, class_name: "Relationship", foreign_key:"follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key:"followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed_user
  has_many :followers, through: :passive_relationships, source: :follower_user

  def recommend_users(n = 3)
    excluded_list = followings.ids.push(id).uniq
    User.where.not(followings: excluded_list).limit(n).order("RANDOM()")
  end

  def feeds
    users = followings.ids.push(id).uniq
    Tweet.where(user: users)
  end
end