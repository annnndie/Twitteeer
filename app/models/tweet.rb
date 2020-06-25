class Tweet < ApplicationRecord
  validates :content, presence: true,
                      length: { maximum: 280 }
  # relation
  belongs_to :user
end
