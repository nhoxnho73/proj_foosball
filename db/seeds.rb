# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p1 = User.create(first_name: 'Abbruzzi', last_name: 'Aaitui')
p2 = User.create(first_name: 'Joe', last_name: 'Abbey')
p3 = User.create(first_name: 'Fay', last_name: 'Abbott')
p4 = User.create(first_name: 'Vince', last_name: 'Abbott')
p5 = User.create(first_name: 'Jared', last_name: 'Abbrederis')
p6 = User.create(first_name: 'Duke', last_name: 'Abbruzzi')

t1 = Team.create(name: 'Raging Crusaders', players: [p1,p2])
t2 = Team.create(name: 'Pride', players: [p3])
t3 = Team.create(name: 'Privateers', players: [p4])

 
g1 = Game.new(winner: t1, loser: t2, score: 4)
g2 = Game.new(winner: t2, loser: t1, score: 5)
g3 = Game.new(winner: t1, loser: t2, score: 0)
m1 = Match.new(teams: [t1,t2], games: [g1, g2, g3])
m1.save