class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy, :edit_review]

  def create
    if params[:post_id]
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      if @comment.save
        redirect_to post_path(@post), notice: "回覆成功"
      else
        redirect_to post_path(@post), alert: "回復失敗"
      end
    else
      @game = Game.find(params[:game_id])
      @comment = @game.comments.build(comment_params)
      if @comment.save
        redirect_to game_path(@game), notice: "回覆成功" 
      else
        redirect_to game_path(@game), alert: "回復失敗" 
      end
    end
  end

  def edit
  end

  def edit_review
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @comment.commentable.class.name == "Game"
      if @comment.update(comment_params)
        redirect_to game_path(@comment.commentable), notice: "修改成功"
      else
        redirect_to game_path(@comment.commentable), notice: "修改失敗"
      end
    else
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to post_path(@comment.commentable), notice: "修改成功" }
          format.json { respond_with_bip(@comment) }
        end
      end
    end
  end

  def destroy
    if @comment.destroy && !!params[:post_id]
      redirect_to post_path(@comment.commentable), notice: '留言刪除成功'
    elsif @comment.destroy && !!params[:mboard_id]
      respond_to do |format|
        format.html { redirect_to mboards_path, notice: '留言刪d除成功' }
        format.js 
      end
    else @comment.destroy && !!params[:game_id]
      redirect_to game_path(@comment.commentable), notice: '留言刪除成功'
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:name, :comment, :rating)
  end

  def set_comment
    @comment = Comment.includes(:replies).find(params[:id]) 
  end

end
