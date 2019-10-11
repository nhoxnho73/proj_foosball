class RankingController < ApplicationController
  
  def index
    teams = Team.all
    @stats = []

    teams.each do |team|
      matches_user = team.matches.count
      winning_matches = team.winning_matches.count
      match_winning_percent = ( winning_matches / matches_user.to_f * 100 ).round(2)
      @stats << {
        name: team.name,
        winner_games: team.winner_games.count,
        losing_games: team.losing_games.count,
        matches_user: matches_user,
        winning_matches: winning_matches,
        match_winning_percent: "#{ match_winning_percent } %"
      }
    end
  end
  
end
