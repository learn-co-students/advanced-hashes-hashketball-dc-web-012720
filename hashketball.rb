def game_hash()
  resultHash = 
{
 :home => {
   :team_name => "Brooklyn Nets",
   :colors => ["Black", "White"],
   :players => [

      {:player_name => "Alan Anderson", #hash[:home][:players][0]
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },

      {:player_name => "Reggie Evans", #hash[:home][:players][1]
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },

      {:player_name => "Brook Lopez", #hash[:home][:players][2]
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },

      {:player_name => "Mason Plumlee", #hash[:home][:players][3]
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 11,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      }, 
      
      {:player_name => "Jason Terry", #hash[:home][:players][4]
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }
    ]
 }, #End of value for the key :Home

 :away => {
   :team_name => "Charlotte Hornets",
   :colors => ["Turquoise", "Purple"],
   :players => [
     {
       :player_name => "Jeff Adrien", #hash[:home][:players][0]
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
     },

     {:player_name => "Bismack Biyombo", #hash[:home][:players][1]
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10
     },

     {:player_name => "DeSagna Diop", #hash[:home][:players][2]
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
     }, 
     
     {:player_name => "Ben Gordon", #hash[:home][:players][3]
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
     }, 
     
     {:player_name => "Kemba Walker", #hash[:home][:players][4]
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 7,
      :blocks => 5,
      :slam_dunks => 12
     }
    ]
  }
}
  return resultHash
end

def num_points_scored(player_name)
  nds = game_hash()
  player_found = false
  nds.each do |home_or_away_key, home_or_away_valueHash| #home/array_Hash
    home_or_away_valueHash[:players].each do |stats|
      if stats[:player_name] == player_name
        player_found = true
        return stats[:points]
      end
    end
  end
  if player_found == false
    p "we cannot find #{player_name} try again."
  end
end

def shoe_size(player_name)
  nds = game_hash()
  player_found = false
  nds.each do |home_or_away_key, home_or_away_valueHash| #home/array_Hash
    home_or_away_valueHash[:players].each do |stats|
      if stats[:player_name] == player_name
        player_found = true
        return stats[:shoe]
      end
    end
  end
  if player_found == false
    p "we cannot find #{player_name} try again."
  end
end

def player_numbers(team_name)
  nds = game_hash()
  team_numbers = []
  nds.each do |home_or_away_key, value|
    if value[:team_name] == team_name
      value[:players].each do |stat|
        team_numbers << stat[:number]
      end
    end
  end
  return team_numbers.sort
end

def team_colors(team_name)
  nds = game_hash()
  nds.each do |home_or_away_key, value|
    if value[:team_name] == team_name
      return value[:colors]
    end
  end
end

def team_names()
  nds = game_hash()
  array_of_team_names =[]
  nds.each do |home_or_away_key, value|
    array_of_team_names.push(value[:team_name])
  end
  return array_of_team_names
end

def player_stats(player_name)
  nds = game_hash
  nds.each do |home_or_away_key, value|
    value[:players].each do |stat|
      if stat[:player_name] == player_name
        returningHash = stat
        returningHash.delete(:player_name)
        return returningHash
      end
    end
  end
end

def big_shoe_rebounds()
  nds = game_hash
  biggest_shoe_size = 0
  nds.each do |home_or_away_key, value|
    value[:players].each do |stat|
      if stat[:shoe] > biggest_shoe_size
        biggest_shoe_size = stat[:shoe]
      end
    end
  end

  nds.each do |home_or_away_key, value|
    value[:players].each do |stat|
      if stat[:shoe] == biggest_shoe_size
        return stat[:rebounds]
      end
    end
  end
end

def most_points_scored()
  nds = game_hash
  most_points = 0
  nds.each do |home_or_away_key, value|
    value[:players].each do |stat|
      if stat[:points] > most_points
        most_points = stat[:points]
      end
    end
  end

  nds.each do |home_or_away_key, value|
    value[:players].each do |stat|
      if stat[:points] == most_points
        return stat[:player_name]
      end
    end
  end
end

def winning_team()
  nds = game_hash
  home_team_points = 0
  away_team_points = 0
  home_team = ""
  away_team = ""
  nds.each do |home_or_away_key, value|
    if home_or_away_key.to_s == "home"
      home_team = value[:team_name]
    else
      away_team = value[:team_name]
    end
    value[:players].each do |stat|
      if home_or_away_key.to_s == "home"
        home_team_points += stat[:points]
      else
        away_team_points += stat[:points]
      end
    end 
  end
  
  if home_team_points > away_team_points
    return home_team
  else
    return away_team
  end
end

def player_with_longest_name
  nds = game_hash()
  longest_char_length = 0
  nds.each do |home_or_away_key, value|
    value[:players].each do |stat|
      if stat[:player_name].length > longest_char_length
        longest_char_length = stat[:player_name].length
      end
    end
  end
  nds.each do |home_or_away_key, value|
    value[:players].each do |stat|
      if stat[:player_name].length == longest_char_length
        return stat[:player_name]
      end
    end
  end  
end

def long_name_steals_a_ton?()
  nds = game_hash()
  longest_name = player_with_longest_name()
  most_steals = 0
  nds.each do |home_or_away_key, value|
    value[:players].each do |stat|
      if stat[:steals] > most_steals
        most_steals = stat[:steals]
      end
    end
  end

  nds.each do |home_or_away_key, value|
    value[:players].each do |stat|
      if ((stat[:steals] == most_steals) && (stat[:player_name] == longest_name))
        return true
      end
    end
  end
end