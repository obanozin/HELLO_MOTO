class TouringsController < ApplicationController

  # GET /tourings
  # GET /tourings.json
  def index
    @team = Team.find(params[:team_id])
    @tourings = @team.tourings
  end

  # GET /tourings/1
  # GET /tourings/1.json
  def show
    @tourings = Touring.find(params[:id])
    
  end

  # GET /tourings/new
  def new
    @user = current_user
    @team = Team.find(params[:team_id])
    @touring = Touring.new
  end

  # GET /tourings/1/edit
  def edit
  end

  # POST /tourings
  # POST /tourings.json
  def create
    @touring = Touring.new(touring_params)
    @touring.user = current_user
    @touring.save
    binding.pry
  end

  # PATCH/PUT /tourings/1
  # PATCH/PUT /tourings/1.json
  def update
    respond_to do |format|
      if @touring.update(touring_params)
        format.html { redirect_to @touring, notice: 'Touring was successfully updated.' }
        format.json { render :show, status: :ok, location: @touring }
      else
        format.html { render :edit }
        format.json { render json: @touring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tourings/1
  # DELETE /tourings/1.json
  def destroy
    @touring.destroy
    respond_to do |format|
      format.html { redirect_to tourings_url, notice: 'Touring was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def touring_params
      params.require(:touring).permit(:touring_name, :user_id,:team_id,:touring_image,:destination,:touring_date,:touring_detail)
    end
end
