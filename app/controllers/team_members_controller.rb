class TeamMembersController < ApplicationController
  before_action :set_team_member, only: [:show, :edit, :update, :destroy]

  # GET /team_members
  # GET /team_members.json
  def index
    @team = Team.find(params[:team_id])
    @team_members = @team.team_members.approval
  end
  def show
  end

  def people
    @team = Team.find(params[:team_id])
    if @team.user == current_user
      @team_members = @team.team_members.hold
    else
      redirect_to teams_path
    end
  end
  # GET /team_members/new
  def new
    @user = User.find(current_user.id)
    @team = Team.find(params[:team_id])
    @team_member = TeamMember.new
  end

  # GET /team_members/1/edit
  def edit
  end
  # POST /team_members
  # POST /team_members.json
  def create
    @team_member = TeamMember.new(team_member_params)
    @team_member.user_id = current_user.id
    if @team_member.save
        redirect_to user_path(current_user)
    else
        redirect_to teams_path
    end
  end

  # PATCH/PUT /team_members/1
  # PATCH/PUT /team_members/1.json
  def update
    @team_member.approval!
    redirect_to team_team_members_path(@team_member.team)

    # respond_to do |format|
    #   if @team_member.update(team_member_params)
    #     format.html { redirect_to @team_member, notice: 'Team member was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @team_member }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @team_member.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /team_members/1
  # DELETE /team_members/1.json
  def destroy
    @team_member.destroy
    redirect_to  team_team_members_path(@team_member.team)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_member_params
      params.require(:team_member).permit(:user_id, :team_id, :request_comment, :is_team)
    end
end
