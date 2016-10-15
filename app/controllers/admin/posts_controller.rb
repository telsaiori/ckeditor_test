class Admin::PostsController < ApplicationController
  layout "admin"

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :auth_user, except: [:index, :show, :category_post]

  # GET /posts
  # GET /posts.json
  def index
    @posts_by_date = Post.all.group_by{|x| x.created_at.strftime("%Y-%m-%d")} 
    # @posts_by_date = Post.all.group_by(&:created_at)
    @date = params[:date]? Date.parse(params[:date]) : Date.today
    if params[:search]
      @posts = Post.where("content LIKE :search OR title LIKE :search", search: "%#{params[:search]}%")
    elsif params[:posts_by_date]
      d = params[:posts_by_date].to_datetime
      @posts = Post.where(created_at: d.beginning_of_day..d.end_of_day)
    else
      @posts = Post.order('created_at desc')
    end
    @posts = @posts.includes(:category).page(params[:page])
  end

  # GET /posts/1
  # GET /posts/1.json
  def category_post
    @category = params[:category]
    @posts = Category.find_by(name: @category).try(:posts).page(params[:page])
  end

  def show
    @comment = Comment.new
    @reply = Reply.new
  end

  # GET /posts/new
  def new
    @post = Admin::Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Admin::Post.new(post_params)

    if @post.save
      category_id = Category.find_by(name: params[:category]).id
      @post.update(category_id: category_id)
      redirect_to admin_post_path(@post), notice: 'Post was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        unless @post.category.try(:name) == params[:category]
          @post.category= Category.find_by(name: params[:category])
          @post.save
        else
          @post.build_category(name: params[:category])
        end
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if @post.destroy
      redirect_to admin_posts_path, notice: '刪除成功'
    end
  end

  def multi_del
    Post.destroy_all(id: params[:del_posts])
    redirect_to admin_posts_path, notice: '刪除成功'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Admin::Post.includes(:category).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:admin_post).permit(:title, :content)
    end
end
