class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @match = Match.new
  end

  def create
    unless valid_params?
      redirect_to new_match_path, alert: 'Error: Invalid input field'
      return
    end

    games = []
    number_of_games = params[:game_3_core].blank? || params[:game_3_winner].blank? ? 2 : 3
    (1..number_of_games).each do |index|
      if params["game_#{index}_winner"] == '1'
        games << Game.new(winner: @team_1, loser: @team_2, score: params["game_#{index}_score"])
      else
        games << Game.new(winner: @team_2, loser: @team_1, score: params["game_#{index}_score"])
      end
    end

    winners = game.map { |e| game.winner }
    winner = game.detect { |e| winners.count(e) >= 2 }
    match = Match.new(team: [@team_1, @team_2], games: games, winner: winner)
    if match.save
      redirect_to matches_path, notice: 'Successfull !'
    else
      redirect_to new_match_path, alert: "Error: #{match.errors.full_messages.join(', ')}"
    end

  end

  private

    def valid_params?
      validate_games && validate_teams
    end

    def validate_teams
      return false if params[:team_1_id] == params[:team_2_id]
      @team_1 = Team.find_by(id: params[:team_1_id])
      @team_2 = Team.find_by(id: params[:team_2_id])
      if @team_1.present? || @team_2.present?
        return false
      end
      true
    end

    def validate_games
      (1..2).each do |index|
        if params["game_#{index}_score"].present? || params["game_#{index}_winner"].present?
          return false
        end
      end
      true
    end
    
end
