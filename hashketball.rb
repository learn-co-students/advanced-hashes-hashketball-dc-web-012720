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

=begin

In the methods below, the data_set.each needs TWO BLOCK PARAMETERS
Because when we use .each on the initial NDS, it will only give the KEYS but not the VALUES
associated with the two main keys provided (Home and Away)... by adding a 2nd parameter,
we have access to the values of those keys.

For example in num_points_scored() method, the line where I have:
  data_set.each do |key, key_value|
  
  key[:players] will give an error since key... literally represents a key thats it!
  In this lab our key variable will only be :home & :away

=end

def num_points_scored(player_name)
  player_found = false #so far we dont know if this player is actually here
  data_set = game_hash()
  #need to iterate through both home and away team players, because the player we are looking for can be on either team.
  data_set.each do |key, key_value|
    key_value[:players].each do |player_stats|
      if player_stats[:player_name] == player_name #if the current player name matches our argument
        player_found = true #player has been found
        return player_stats[:points] #returns the current player's points scored
      end
    end
  end
  if player_found == false
    return "#{player_name} is on neither home or away team, try again."
  end
end

def shoe_size(player_name)
  player_found = false #so far we dont know if this player is actually here
  data_set = game_hash()
  #similar to previous method, we need to iterate through both home and away team players to locate our desired player.
  data_set.each do |key, key_value|
    key_value[:players].each do |player_stats|
      #if the current player name matches our input/ provided argument
      if player_stats[:player_name] == player_name
        player_found = true #player has been found
        return player_stats[:shoe] #returns the current player's shoe size
      end
    end
  end
  if player_found == false
    return "Cannot locate '#{player_name}' shoe size. Invalid name"
  end

end

def team_colors(team_name)
  team_found = false
  data_set = game_hash()
  data_set.each do |key, key_value| #iterates between both home and away key
    if key_value[:team_name] == team_name
      team_found = true
      return key_value[:colors] #returns team_color array
    end
  end
  if team_found == false
    return "Invalid team name... try again"
  end
end

#Goal is to return an array of the two teams playing (home & away team)
def team_names
  data_set = game_hash()
  newArr = []
  data_set.each do |key, key_value|
    newArr << key_value[:team_name] #pushing the team name into array
  end
  return newArr #explicit return of newArr
end

#Goal of this method is to return an array of player jersey numbers on that team.
def player_numbers(team_name)
  newArr = [] #we will return this
  data_set = game_hash()
  data_set.each do |key, key_value| 
    if team_name == key_value[:team_name]
      key_value[:players].each do |player_stat|  #iterates to all players on specific team
        newArr << player_stat[:number]      #adding numbers to newArr
      end
    end
  end
  return newArr.sort
end

#Goal of this method is to return player_stat hash without player_name key-value pair
def player_stats(player_name)
  data_set = game_hash()
  data_set.each do |key, key_value|
    key_value[:players].each do |player_stat|
      if player_stat[:player_name] == player_name
        player_stat.delete(:player_name)
        return player_stat #Should return hash excluding player_name key
      end
    end
  end
end

#When first doing this lab, I iterated through both teams twice to first find the
#biggest shoe-size, then went back again to find the matching player stats 

#In this second run through I figured another way by first getting the total number of players playing... and then set it up so that if the max player count is reached, I can just return the current maximum shoe-sized player's rebounds... 
#I could simply set the total_number of players to 10, but that is not scalable so I set it by the sum of the lengths of players on both teams.
def big_shoe_rebounds
  data_set = game_hash()
  total_num_players = data_set[:home][:players].length + data_set[:away][:players].length
  count = 0
  max_shoe_size = 0
  largest_shoe_rebounds = 0
  data_set.each do |key, key_value|
    key_value[:players].each do |player_stat|
      count += 1
      if player_stat[:shoe] > max_shoe_size
        max_shoe_size = player_stat[:shoe]
        largest_shoe_rebounds = player_stat[:rebounds]
      end
      if count == total_num_players
        return largest_shoe_rebounds #remember returning max rebound for biggest shoe.
      end
      # I made two if statements because I think these two 
      # conditional statements are independent of eachother, I could be wrong.
    end
  end
end

# Comparing big_shoe_rebounds and most_points_scored...
#This method below is the scenario where I iterate through the data structure again...
#which I think is worst for scalability. The below method could be solved using the approach
#involved with big_shoe_rebounds method
def most_points_scored
  most_points = 0
  data_set = game_hash()
  data_set.each do |key, key_value|
    key_value[:players].each do |player_stat|
      if player_stat[:points] > most_points
        most_points = player_stat[:points]
      end
    end
  end
  data_set.each do |key, key_value|
    key_value[:players].each do |player_stat|
      if player_stat[:points] == most_points
        return player_stat[:player_name]
      end
    end
  end  
end

def winning_team
  #need to declare these out here so I can access and return them later.
  home_team_score = 0  
  away_team_score = 0
  home_team_name = ""
  away_team_name = ""
  data_set = game_hash()
  data_set.each do |key, key_value|
    #if and else will only be reached once.
    if key.to_s == "home"
      home_team_name += key_value[:team_name]
      key_value[:players].each do |player_stat|
        home_team_score += player_stat[:points]
      end
    else
      away_team_name += key_value[:team_name]
      key_value[:players].each do |player_stat|
        away_team_score += player_stat[:points]
      end
    end
  end

  #Below is why I declared the 4 variables in beginning of method.
  if home_team_score > away_team_score
    return home_team_name
  else
    return away_team_name
  end
end

#Method below has similar approach to big_shoe_method... iterate through hash once.
def player_with_longest_name
  data_set = game_hash()
  total_num_players = data_set[:home][:players].length + data_set[:away][:players].length
  name_of_player = "" #this is what we are returning
  longest_name = 0
  count = 0
  data_set.each do |key, key_value|
    key_value[:players].each do |player_stat|
      count += 1
      if player_stat[:player_name].length > longest_name
        longest_name = player_stat[:player_name].length
        # "string".replace() replaces current string with whatever is placed in the argument. 
        name_of_player.replace(player_stat[:player_name]) 
      end
      if count == total_num_players
        return name_of_player #returning longest_name
      end
    end
  end  
end

def long_name_steals_a_ton?()
  data_set = game_hash()
  total_num_players = data_set[:home][:players].length + data_set[:away][:players].length
  answer = false
  count = 0
  longest_name_length = 0
  name_w_most_steals = ""
  name_w_longest_len = ""
  most_steals = 0
  data_set.each do |key, key_value|
    key_value[:players].each do |p_stat|
      count += 1
      if p_stat[:steals] > most_steals
        most_steals = p_stat[:steals]
        name_w_most_steals.replace(p_stat[:player_name])
      end
      if p_stat[:player_name].length > longest_name_length
        longest_name_length = p_stat[:player_name].length
        name_w_longest_len.replace(p_stat[:player_name]) 
      end
      if count == total_num_players
        if name_w_most_steals == name_w_longest_len
          return true
        else
          return false
        end
      end
    end
  end
end