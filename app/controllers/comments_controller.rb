class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy, :edit_review]

  def create
    if params[:controller] == "posts"
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      if @comment.save
        redirect_to post_path(@post) 
      else
        redirect_to post_path(@post) 
      end
    else
      @game = Game.find(params[:game_id])
      @comment = @game.comments.build(comment_params)
      if @comment.save
        redirect_to game_path(@game) 
      else
        redirect_to game_path(@game) 
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
    end
  end

  def destroy
    controller = params[:controller]
    if @comment.destroy && controller == "posts"
      redirect_to post_path(@comment.commentable), notice: '留言刪除成功'
    else @comment.destroy && controller == "games"
      redirect_to game_path(@comment.commentable), notice: '留言刪除成功'
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:name, :comment, :rating)
  end

  def set_comment
    @comment = Comment.find(params[:id]) 
  end

end
