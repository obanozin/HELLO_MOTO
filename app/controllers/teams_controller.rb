class TeamsController < ApplicationController

  PER = 6
  def index
    @teams = Team.page(params[:page]).per(PER).order(id: "DESC")
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
    @member = TeamMember.where(team_id: params[:id]).where(is_team: 1).pluck(:user_id)
    @messages = @team.message_teams.limit(20).order(created_at: :desc)
  end

  # GET /teams/new
  def new
    @user = current_user
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit

    @team = Team.find(params[:id])
    if @team.user == current_user
    else
      redirect_to teams_path
    end
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.user = current_user
    @team.save!

    #team_member_params = {}
    team_member_params = {
      team_id: @team.id,
      user_id: current_user.id,
      request_comment: "",
      is_team: 1
    }
    #binding.pry
    @member = TeamMember.new(team_member_params)
    @member.save

    redirect_to teams_path
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to team_path(@team)
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    if admin_signed_in?
          redirect_to admins_path
    else
      redirect_to teams_path
    end
  end


  private
  def team_params
    params.require(:team).permit(:team_name, :user_id,:team_introduction,:team_image,:age_range)
  end
end
