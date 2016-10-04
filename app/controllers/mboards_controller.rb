class MboardsController < ApplicationController
  def index
    @posts = Mboard.order("created_at desc")
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


  private

  def post_params
    params.require(:mboard).permit(:name, :post)
  end
end
