class Admin::MboardsController < ApplicationController
  layout 'admin'
  before_action :set_admin_mboard, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :auth_user

  # GET /admin/mboards
  # GET /admin/mboards.json
  def index
    @admin_mboards = Admin::Mboard.all.page(params[:page])
  end

  # GET /admin/mboards/1
  # GET /admin/mboards/1.json
  def show
  end

  # GET /admin/mboards/new
  def new
    @admin_mboard = Admin::Mboard.new
  end

  # GET /admin/mboards/1/edit
  def edit
  end

  # POST /admin/mboards
  # POST /admin/mboards.json
  def create
    @admin_mboard = Admin::Mboard.new(admin_mboard_params)

    respond_to do |format|
      if @admin_mboard.save
        format.html { redirect_to admin_mboards_path, notice: 'Mboard was successfully created.' }
        format.json { render :show, status: :created, location: @admin_mboard }
      else
        format.html { render :new }
        format.json { render json: @admin_mboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/mboards/1
  # PATCH/PUT /admin/mboards/1.json
  def update
    respond_to do |format|
      if @admin_mboard.update(admin_mboard_params)
        format.html { redirect_to @admin_mboard, notice: 'Mboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_mboard }
      else
        format.html { render :edit }
        format.json { render json: @admin_mboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/mboards/1
  # DELETE /admin/mboards/1.json
  def destroy
    @admin_mboard.destroy
    respond_to do |format|
      format.html { redirect_to admin_mboards_url, notice: 'Mboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def multi_del
    Mboard.destroy_all(id: params[:del_mboards])
    redirect_back(fallback_location: root_path, notice: '刪除成功')

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_mboard
      @admin_mboard = Admin::Mboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_mboard_params
      params.require(:admin_mboard).permit(:name, :post)
    end
end
