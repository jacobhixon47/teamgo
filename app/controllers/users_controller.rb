class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @owned_teams = []
    @user.teams.each do |team|
      if team.admin_ids.include? @user.id
        @owned_teams.push(team)
      end
    end
  end
end
