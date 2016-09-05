class Comment < ApplicationRecord
  belongs_to :post
  has_many :replies, dependent: :destroy
  validates :name, presence: true
  validates :comment, presence: true
end
