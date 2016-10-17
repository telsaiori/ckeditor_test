class RepliesController < ApplicationController
  before_action :set_reply, only: [:update, :destroy]
  before_action :authenticate_user!

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

  def destroy
    if @reply.destroy
      redirect_back fallback_location: root_path, notice: '刪除留言成功'
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:name, :reply)
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

end
