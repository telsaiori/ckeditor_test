module Admin::CommentsHelper
  def link_to_post(comment)
    if comment.commentable_type == "Post"
      link_to Post.find(comment.commentable_id).title, post_path(comment.commentable_id), target: '_blank'
    elsif comment.commentable_type == "Game"
      link_to Game.find(comment.commentable_id).title, game_path(comment.commentable_id), target: '_blank'

    end
  end
end
