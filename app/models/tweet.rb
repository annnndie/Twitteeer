class Tweet < ApplicationRecord
  acts_as_paranoid
  validates :content, presence: true,
                      length: { maximum: 280 }
  # relation
  belongs_to :user
end
