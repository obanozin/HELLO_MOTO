class TouringsController < ApplicationController

  # GET /tourings
  # GET /tourings.json
  def index
    @team = Team.find(params[:team_id])
    user_meta = @team.team_members.find_by(user: current_user.id)
    if user_meta.nil?
      redirect_to teams_path
      return
    end
    if user_meta.is_team == 1
       redirect_to teams_path
       return
    end
    @tourings = @team.tourings
  end

  # GET /tourings/1
  # GET /tourings/1.json
  def show
    @tourings = Touring.find(params[:id])
    @team = Team.find(params[:team_id])
    user_meta = @team.team_members.find_by(user: current_user.id)
    if user_meta.nil?
      redirect_to teams_path
      return
    end
    unless user_meta.is_team == 1
      @touring_member = TouringMember.find_by(user: current_user, touring: @tourings)
      @messages = @tourings.message_tourings.limit(20).order(created_at: :desc)
    else
      redirect_to teams_path
    end
  end

  # GET /tourings/new
  def new
    @user = current_user
    @team = Team.find(params[:team_id])
    user_meta = @team.team_members.find_by(user: current_user.id)
    if user_meta.nil?
      redirect_to teams_path
      return
    end
    unless user_meta.is_team == 1
      @touring = Touring.new
    else
      redirect_to teams_path
    end
  end

  # GET /tourings/1/edit
  def edit
    @tourings = Touring.find(params[:id])
  end

  # POST /tourings
  # POST /tourings.json
  def create
    @team = Team.find(params[:team_id])
    @touring = Touring.new(touring_params)
    @touring.user = current_user
    @touring.save
    redirect_to team_tourings_path(@team.id)
  end

  # PATCH/PUT /tourings/1
  # PATCH/PUT /tourings/1.json
  def update
    @team = Team.find(params[:team_id])
    @tourings = Touring.find(params[:id])
    @tourings.update(touring_params)
    redirect_to team_touring_path(team_id: @team.id, id: @tourings.id)


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
      params.require(:touring).permit(:touring_name, :user_id,:team_id,:touring_image,:destination,:touring_date,:touring_detail, :meet)
    end
end
