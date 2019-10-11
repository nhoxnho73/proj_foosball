class Game < ApplicationRecord
  belongs_to :match
  belongs_to :winner, :class_name => 'Team'
  belongs_to :loser, :class_name => 'Team'
  
  validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  
end
