class Game < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments, as: :commentable, dependent: :destroy
end
