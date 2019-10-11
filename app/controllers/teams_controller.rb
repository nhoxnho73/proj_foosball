class TeamsController < ApplicationController
  
  def index
    @teams = Team.all
    @team = Team.new
  end

  def create
    team = Team.new(team_params)
    user_ids = params[:user_id].uniq.reject{ |u| u.empty? }
    team.users = User.find(user_ids)

    if team.save
      redirect_to teams_path, notice: 'Successfull !'
    else
      redirect_to new_team_path, alert: "Error: #{team.error.full_messages.join(', ')}"
    end
  end

  private

    def team_params
      params.require(:team).permit(:name)
    end
  
  
end