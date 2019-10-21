class TeamsController < ApplicationController
  # before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
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
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.user = current_user
    @team.save!
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
    redirect_to teams_path
  end


  private
  def team_params
    params.require(:team).permit(:team_name, :user_id,:team_introduction,:team_image,:age_range)
  end
end
