class CommentsController < ApplicationController
  # def new
  #   @comment = Comment.new
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post) 
    else
      redirect_to post_path(@post) 
      
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:name, :comment)
  end

end
