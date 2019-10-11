class CreateTeamMatch < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teams, :matches
  end
end
