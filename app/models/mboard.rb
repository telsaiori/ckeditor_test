class Mboard < ApplicationRecord
  validates :post, presence: true
  has_many :comments, as: :commentable, dependent: :destroy
  # accepts_nested_attributes_for :comments
end
