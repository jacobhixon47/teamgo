class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = Team.all
  end
  def show
    @team = Team.find(params[:id])
    if !@team.users.include? current_user
      redirect_to new_user_team_path(current_user)
    end
  end

  def new
    @user = current_user
    @team = Team.new
  end

  def create
    @user = current_user
    @team = Team.new(team_params)
    if @team.save
      @user.team_memberships.create(team_id: @team.id)
      member_ids = params[:member_ids]
      if member_ids
        member_ids.each do |id|
          user = User.find(id)
          user.team_memberships.create(team_id: @team.id)
        end
      end
      @team.admin_ids.push(@user.id)
      @team.save
      flash[:notice] = "Your team has been created!"
      redirect_to team_path(@team)
    else
      flash[:alert] = "There was a problem creating your team. Please try again."
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
    if @team.admin_ids.include? current_user.id
      @potential_users = []
      User.all.each do |user|
        if !user.teams.include? @team
          @potential_users.push(user)
        end
      end
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js
      end
    else
      redirect_to user_path(current_user)
      flash[:notice] = "Oops! Looks like you don't have permission to do that!"
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.admin_ids.include? current_user.id
      member_ids = params[:member_ids]
      if member_ids
        member_ids.each do |id|
          user = User.find(id)
          user.team_memberships.create(team_id: @team.id)
        end
        respond_to do |format|
          format.html { redirect_to user_path(current_user) }
          format.js
        end
        flash[:notice] = "Successfully added!"
      else
        render :edit
      end
    else
      redirect_to user_path(current_user)
      flash[:notice] = "Oops! Looks like you don't have permission to do that!"
    end
  end

private
  def team_params
    params.require(:team).permit(:name, :admin_ids)
  end
end
