class RepliesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.build(reply_params)
    if @reply.save
      redirect_to post_url(@post)
    else
      redirect_to post_url(@post), notice: '回覆失敗'
    end

  end

  private

  def reply_params
    params.require(:reply).permit(:name, :reply)
  end
end
