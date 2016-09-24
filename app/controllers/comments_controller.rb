class CommentsController < ApplicationController
  # def new
  #   @comment = Comment.new
  # end

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

  def destroy
    @comment = Comment.find(params[:id]) 
    if @comment.destroy
      redirect_to post_url(@comment.post), notice: '留言刪除成功'
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:name, :comment, :rating)
  end


end
