class Admin::RepliesController < ApplicationController
  layout "admin"
  before_action :set_admin_reply, only: [:show, :edit, :update, :destroy]

  # GET /admin/replies
  # GET /admin/replies.json
  def index
    @admin_replies = Admin::Reply.all
  end

  # GET /admin/replies/1
  # GET /admin/replies/1.json
  def show
  end

  # GET /admin/replies/new
  def new
    @admin_reply = Admin::Reply.new
  end

  # GET /admin/replies/1/edit
  def edit
  end

  # POST /admin/replies
  # POST /admin/replies.json
  def create
    @admin_reply = Admin::Reply.new(admin_reply_params)

    respond_to do |format|
      if @admin_reply.save
        format.html { redirect_to @admin_reply, notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @admin_reply }
      else
        format.html { render :new }
        format.json { render json: @admin_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/replies/1
  # PATCH/PUT /admin/replies/1.json
  def update
    respond_to do |format|
      if @admin_reply.update(admin_reply_params)
        format.html { redirect_to @admin_reply, notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_reply }
      else
        format.html { render :edit }
        format.json { render json: @admin_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/replies/1
  # DELETE /admin/replies/1.json
  def destroy
    @admin_reply.destroy
    respond_to do |format|
      format.html { redirect_to admin_replies_url, notice: 'Reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def multi_del
    Reply.destroy_all(id: params[:del_replies])
    redirect_back(fallback_location: root_path, notice: '刪除成功') 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_reply
      @admin_reply = Admin::Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_reply_params
      params.fetch(:admin_reply, {})
    end
end
