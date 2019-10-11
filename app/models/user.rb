class User < ApplicationRecord
  belongs_to :team, optional: true
  validates :first_name, :last_name, presence :true

  def team_name
    team.present? ? team.name : nil
  end
  
end