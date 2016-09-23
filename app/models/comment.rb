class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :replies, dependent: :destroy
  validates :name, presence: true
  validates :comment, presence: true
end
