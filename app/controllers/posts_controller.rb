class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /posts
  # GET /posts.json
  def index
    @posts_by_date = Post.all.group_by{|x| x.created_at.strftime("%Y-%m-%d")} 
    # @posts_by_date = Post.all.group_by(&:created_at)
    @date = params[:date]? Date.parse(params[:date]) : Date.today
    if params[:search]
      @posts = Post.where("content like ?", "%#{params[:search]}%")
    elsif params[:posts_by_date]
      @posts = Post.where("created_at like ?", "%#{params[:posts_by_date]}%")
    else
      @posts = Post.all
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def category_post
    @category = params[:category]
    @posts = Category.find_by(name: @category).posts
  end

  def show
    @comment = Comment.new
    @reply = Reply.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        category_id = Category.find_by(name: params[:category]).id
        @post.update(category_id: category_id)
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        unless @post.category.name == params[:category]
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
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
