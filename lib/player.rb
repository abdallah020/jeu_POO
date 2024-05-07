

class Player

   attr_accessor :name,:life_points
   
   def initialize(name,life_points)
     @name = name
     @life_points = life_points
     
   end
   
   def show_state
     
     puts "#{@name} a #{@life_points} points de vie"
   end
   
   def gets_damage(dom)
     @life_points -= dom
     
     if @life_points >=dom
        puts "il vous reste #{@life_points}"
        
        
      elsif @life_points <=0
        puts "le joueur José a été tué !"
     end
   end
   
   def attacks(player)
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    damage = compute_damage
    player.gets_damage(damage)
    puts "il lui inflige #{damage} points de dommages"
    
  end

  private

  def compute_damage
    rand(1..6) #points de vie et une arme de niveau 
  end
   
end

class HumanPlayer < Player
 
   attr_accessor :weapon_level
   def initialize(name, life_points)
     @name = name
     @life_points = life_points
     @weapon_level = 1
   end
   
   def show_state
     
     puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
   end
   
   def compute_damage
     rand(1..6) * @weapon_level # points de vie et une arme de niveau 
   end
   
   def search_weapon
     new_weapon_level = rand(1..6)
     puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
     
     if new_weapon_level > @weapon_level
       @weapon_level = new_weapon_level
       puts "le niveau de cette nouvelle arme est #{new_weapon_level} et supérieur à #{@weapon_level}"
       else
         puts "elle n'est pas mieux que ton arme actuelle."
     end
   end
   
   def search_health_pack
    dice_roll = rand(1..6)
    if dice_roll == 1
      puts "Tu n'as rien trouvé..."
    elsif dice_roll.between?(2, 5)
      @life_points += 50
      @life_points = 100 if @life_points > 100
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      @life_points += 80
      @life_points = 100 if @life_points > 100
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
   
end
 
 
 
 
 
 
 
 
 
