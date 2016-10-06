class MboardsController < ApplicationController
  def index
    @posts = Mboard.order("created_at desc")
    @comment = Comment.new
  end

  def new
    @post = Mboard.new
    
  end

  def create
    @post = Mboard.new(post_params)
    if @post.save
      redirect_to mboards_path, notice: '留言新增成功'
    else
      render action: 'new', notice: '內容不得為空'
    end
  end

  def show
    @post = Mboard.find(params[:id])
  end

  def add_comment
    @post = Mboard.find(params[:comment][:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to mboards_path, notice: "回覆成功"
    else
      render :back
    end

  end


  private

  def post_params
    params.require(:mboard).permit(:name, :post)
  end

  def comment_params
    params.require(:comment).permit(:name, :comment, :user_id)
  end
end
