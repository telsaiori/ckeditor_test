class Post < ActiveRecord::Base
  paginates_per 1

  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy

end
