class Game < ApplicationRecord
  mount_uploader :image, ImageUploader
end
