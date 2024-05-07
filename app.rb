require 'bundler'
require "pry"
# lib/user.rb
  Bundler.require

  require_relative 'lib/game'

  require_relative 'lib/player'


  player1 = Player.new("Josiane",10)
  player2 = Player.new("José",10)

  puts "Voici l'état de chaque joueur :"
  player1.show_state
  player2.show_state

  puts "Passons à la phase d'attaque :"

  
  while player1.life_points > 0 && player2.life_points > 0
  player1.attacks(player2)
  break if player2.life_points <= 0

  player2.attacks(player1)
  break if player1.life_points <= 0
end


  binding.pry
