class MboardsController < ApplicationController

  before_action :set_post, only: [:show, :destroy, :update]
  
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

  def update
    @post.update(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to mboards_path, notice: "編輯成功"}
      else
        format.html { render :back}
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to mboards_path, notice: "刪除成功"
  end


  private

  def post_params
    params.require(:mboard).permit(:name, :post)
  end

  def comment_params
    params.require(:comment).permit(:name, :comment, :user_id)
  end

  def set_post
    @post = Mboard.find(params[:id])
  end
end
