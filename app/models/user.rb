class User < ApplicationRecord
  validates :email, presence: true, 
                    format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
                              message: "格式無效" },
                    uniqueness: true
  validates :password, length: { minimum: 6 }
                
end
