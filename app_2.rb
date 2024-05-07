 
 
  require 'bundler'

  Bundler.require

  require_relative 'lib/game'

  require_relative 'lib/player'
  
  puts "------------------------------------------------"
  
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' ! |"
  
  puts "|Le but du jeu est d'être le dernier survivant !|"
  
  puts "------------------------------------------------"
  
  puts "Quel est votre nom ?"
  print ">"
  name = gets.chomp
  
  user = HumanPlayer.new(name,100)
  
  user.show_state
  
  enemies =[player1 = Player.new("Josiane",10),player2 = Player.new("José",10)]
  
  player1.show_state
  player2.show_state
  
  
  while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  
	  puts user.show_state
	  puts "Quelle action veux-tu effectuer ?"
	  puts "a - chercher une meilleure arme"
	  puts "s - chercher à se soigner"
	  puts "attaquer un joueur en vue :"
	  puts "0 - Josiane a #{player1.life_points} points de vie"
	  puts "1 - José a #{player2.life_points} points de vie"
	  print "> "
	  choice = gets.chomp
		  case choice
		  when "a"
		    user.search_weapon
		  when "s"
		    user.search_health_pack
		  when "0"
		    user.attacks(player1)
		  when "1"
		    user.attacks(player2)
		  else
		    puts "Commande invalide, réessaye !"
		  end

		  puts "Les autres joueurs t'attaquent !"
		  enemies.each do |enemy|
		    if enemy.life_points > 0
		      enemy.attacks(user)
		    end
		  end

		  puts "Appuie sur Entrée pour continuer"
		  gets.chomp
		end

		puts "La partie est finie"
		if user.life_points > 0
		  puts "BRAVO ! TU AS GAGNE !"
		else
		  puts "Loser ! Tu as perdu !"
		end
	     

