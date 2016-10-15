module Admin::RepliesHelper
  def find_blog(reply)
    comment = Comment.find(reply.comment_id)
    Post.find(comment.commentable_id)
  end
end
