

 class Game
  attr_accessor :human_player, :enemies

  def initialize(human_name,life_points)
    @human_player = HumanPlayer.new(human_name, life_points)
    @enemies = []
    4.times { @enemies << Player.new("Bot",20) }
  end

  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && !@enemies.empty?
  end

  def show_players
    puts "Voici l'état du joueur humain :"
    @human_player.show_state
    puts "\nIl reste #{enemies.length} joueur(s) en vie."
  end

  def menu
    puts "Voici les actions possibles :"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "\nAttaquer un joueur en vue :"
    @enemies.each_with_index do |enemy, index|
      puts "#{index} - #{enemy.show_state}"
    end
  end

  def menu_choice(choice)
    case choice
    when "a"
      @human_player.search_weapon
    when "s"
      @human_player.search_health_pack
    else
      enemy_index = choice.to_i
      if enemy_index < @enemies.length
        @human_player.attacks(@enemies[enemy_index])
        kill_player(@enemies[enemy_index]) if @enemies[enemy_index].life_points <= 0
      end
    end
  end

  def enemies_attack
    @enemies.each do |enemy|
      enemy.attacks(@human_player) if @human_player.life_points > 0
    end
  end

  def end
    puts "Le jeu est terminé !"
    if @human_player.life_points > 0
      puts "Bravo, vous avez gagné !"
    else
      puts "Loser ! Vous avez perdu..."
    end
  end
end

