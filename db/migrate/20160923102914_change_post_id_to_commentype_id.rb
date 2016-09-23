class ChangePostIdToCommentypeId < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :post_id, :commentable_id
    rename_column :comments, :comment_type, :commentable_type
  end
end
