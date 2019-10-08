class MotoInfosController < ApplicationController
  before_action :set_moto_info, only: [:show, :edit, :update, :destroy]

  # GET /moto_infos
  # GET /moto_infos.json
  def index
    @moto_infos = MotoInfo.all
  end

  # GET /moto_infos/1
  # GET /moto_infos/1.json
  def show
  end

  # GET /moto_infos/new
  def new
    @moto_info = MotoInfo.new
  end

  # GET /moto_infos/1/edit
  def edit
  end

  # POST /moto_infos
  # POST /moto_infos.json
  def create
    @moto_info = MotoInfo.new(moto_info_params)

    respond_to do |format|
      if @moto_info.save
        format.html { redirect_to @moto_info, notice: 'Moto info was successfully created.' }
        format.json { render :show, status: :created, location: @moto_info }
      else
        format.html { render :new }
        format.json { render json: @moto_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moto_infos/1
  # PATCH/PUT /moto_infos/1.json
  def update
    respond_to do |format|
      if @moto_info.update(moto_info_params)
        format.html { redirect_to @moto_info, notice: 'Moto info was successfully updated.' }
        format.json { render :show, status: :ok, location: @moto_info }
      else
        format.html { render :edit }
        format.json { render json: @moto_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moto_infos/1
  # DELETE /moto_infos/1.json
  def destroy
    @moto_info.destroy
    respond_to do |format|
      format.html { redirect_to moto_infos_url, notice: 'Moto info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moto_info
      @moto_info = MotoInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moto_info_params
      params.require(:moto_info).permit(:maker_name, :moto_name, :volume, :is_own)
    end
end
