class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :score
      t.references :match, foreign_key: true
      t.references :winner
      t.references :loser

      t.timestamps
    end
  end
end
