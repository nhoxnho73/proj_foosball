class Team < ApplicationRecord
  has_and_belongs_to_many :matches
  has_many :users
  has_many :winner_games, :class_name => 'Game', :foreign_key => 'winner_id'
  has_many :losing_games, :class_name => 'Game', :foreign_key => 'loser_id'
  has_many :winning_matches, :class_name => 'Match', :foreign_key => 'winner_id'

  validates :name, presence: true
  validate :validate_users

  def validate_users
    errors.add(:users, 'too many users') if users.size > 2
    errors.add(:users, 'no user') if users.size < 1
  end
  
end
