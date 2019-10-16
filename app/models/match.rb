class Match < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :games
  belongs_to :winner, :class_name => 'Team', optional: true

  validate :validate_games
  validate :validate_teams

  def validate_games
    erroes.add(:game, 'too many games') if games.size > 3
    erroes.add(:game, 'too few games') if games.size < 2
  end

  def validate_teams
    errors.add(:teams, 'match is between 2 teams') if teams.size != 2
  end
  
end