class RepliesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.build(reply_params)
    if @reply.save
      redirect_to post_url(@post)
    else
      redirect_to post_url(@post), alert: '回覆失敗'
    end
  end

  def update
    @reply = Reply.find(params[:id])
     @post = Post.find(params[:post_id])
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @post, notice: '修改留言成功'}
        format.json { respond_with_bip(@reply) }
      end
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:name, :reply)
  end


end
