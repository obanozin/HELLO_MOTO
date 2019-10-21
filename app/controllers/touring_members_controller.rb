class TouringMembersController < ApplicationController
  before_action :set_touring_member, only: [:show, :edit, :update, :destroy]

  def index
    @touring_members = TouringMember.all
  end

  def create
    @touring_member = TouringMember.new
    @touring_member.touring_id = params[:touring_id]
    @touring_member.user = current_user
    @touring_member.save
    redirect_to team_touring_path(params[:team_id],params[:touring_id])
  end
  def destroy
    @touring_member.destroy
    redirect_to team_touring_path(params[:team_id],params[:touring_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_touring_member
      @touring_member = TouringMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def touring_member_params
      params.require(:touring_member).permit(:user_id, :team_id)
    end
end
