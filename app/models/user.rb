class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :account, presence: true,
                      uniqueness: true, 
                      length: { minimum: 4, maximum: 15 },
                      format: { with: /\A[a-zA-Z0-9]+\z/ }

  # relation
  has_many :tweets

end
