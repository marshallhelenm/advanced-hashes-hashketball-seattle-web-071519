require "pry" 

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ['Black', 'White'], 
      :players => [
        {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        {:player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},	
        {:player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},	
        {:player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},	
        {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}]
    },
    :away => {
      :team_name => "Charlotte Hornets", 
      :colors => ['Turquoise', 'Purple'], 
      :players => [
        {:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        {:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},	
        {:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},	
        {:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},	
        {:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}]    
    }
  }
end
  
def stat_by_player(requested_name, statistic)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      next unless attribute == :players
      data.each do |player_data|
        if requested_name == player_data[:player_name]
        return player_data[statistic]
        end
      end  
    end
  end
end

#def num_points_scored(requested_name)
 # game_hash.each do |location, team_data|
  #  team_data.each do |attribute, data|
   #   next unless attribute == :players
    #  data.each do |player_data|
     #   if requested_name == player_data[:player_name]
      #    player_points = player_data[:points]
       #  
        #return player_points
        #end
      #end  
    #end
  #end
#end 

def num_points_scored(requested_name)
  stat_by_player(requested_name, :points)
end

#def shoe_size(requested_name)
#  game_hash.each do |location, team_data|
#    team_data.each do |attribute, data|
#      next unless attribute == :players
#      data.each do |player_data|
#        if requested_name == player_data[:player_name]
#          player_shoe_size = player_data[:shoe]
#         
#        return player_shoe_size
#        end
#      end  
#    end
#  end
#end 

def shoe_size(requested_name)
  stat_by_player(requested_name, :shoe)
end

def team_colors(requested_name)
  game_hash.each do |location, team_data|
    next unless team_data[:team_name] == requested_name
    requested_colors = team_data[:colors]
    return requested_colors
  end
end 

def team_names
  team_name_array = []
  game_hash.each do |location, team_data|
    team_name_array << team_data[:team_name]
  end
  return team_name_array
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      next unless attribute == :players
      data.each do |player_data|
        if team_name == team_data[:team_name]
        jersey_numbers << player_data[:number]
        end
      end  
    end
  end
  return jersey_numbers
end


def player_stats(requested_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      next unless attribute == :players
      data.each do |player_data|
        if requested_name == player_data[:player_name]
          requested_stats = player_data
          requested_stats.delete_if do |key, value|
            key == :player_name
          end
        return requested_stats
        end
      end  
    end
  end  
end

def big_shoe_rebounds
  shoe_size = 0 
  rebounds = 0 
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      next unless attribute == :players
      data.each do |player_data|
        if player_data[:shoe] > shoe_size
          shoe_size = player_data[:shoe]
          rebounds = player_data[:rebounds]
        end
      end  
    end
  end
  return rebounds
end


def most_points_scored
  num = 0 
  most_player = nil 
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      next unless attribute == :players
      data.each do |player_data|
        if player_data[:points] > num
          num = player_data[:points]
          most_player = player_data[:player_name]
        end
      end  
    end
  end
  return most_player
end

def winning_team
  team_scores = {'Brooklyn Nets' => 0, 'Charlotte Hornets' => 0}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      team_scores[team_data[:team_name]] += stat_by_player(player[:player_name], :points)
    end
  end
  
  #return team_scores.max_by{|key ,value| value}
  return team_scores.key(team_scores.values.max)
  
end

def player_with_longest_name
  num = 0 
  longest_name = nil 
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      next unless attribute == :players
      data.each do |player_data|
        if player_data[:player_name].length > num
          num = player_data[:player_name].length
          longest_name = player_data[:player_name]
        end
      end  
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  num = 0 
  most_player = nil 
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      next unless attribute == :players
      data.each do |player_data|
        if player_data[:steals] > num
          num = player_data[:steals]
          most_player = player_data[:player_name]
        end
      end  
    end
  end
  if player_with_longest_name == most_player
    return true 
  end
  return false
end
