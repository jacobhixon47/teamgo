class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = Team.all
  end
  def show
    @team = Team.find(params[:id])
  end

  def new
    @user = current_user
    @team = Team.new
  end

  def create
    @user = current_user
    @team = Team.new(team_params)
    if @team.save
      @user.team_memberships.create(:team_id => @team.id)
      @team.admin_ids.push(@user.id)
      @team.save
      flash[:notice] = "Your team has been created!"
      redirect_to team_path(@team)
    else
      flash[:alert] = "There was a problem creating your team. Please try again."
      render :new
    end
  end

private
  def team_params
    params.require(:team).permit(:name, :admin_ids)
  end
end
