def game_hash
  game = {
    :home=> {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => [
        {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        {:player_name => "Reggie Evans" , :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        {:player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        {:player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
        ]
    }, 
    :away => {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"], 
      :players => [   
        {:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        {:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
        {:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        {:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        {:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
        ]
      }
    }
  game
end

# pp game_hash


def num_points_scored(name)
game = game_hash
i = 0 
  while i < game[:home][:players].length
    if game[:home][:players][i][:player_name] == name
      total_points = game[:home][:players][i][:points]
    end
      i += 1 
  end
k = 0 
  while k < game[:away][:players].length
    if game[:away][:players][k][:player_name] == name
      total_points = game[:away][:players][k][:points]
    end
    k += 1
  end 
 total_points
end


def shoe_size(name)
game = game_hash
i = 0 
  while i < game[:home][:players].length
    if game[:home][:players][i][:player_name] == name
      size = game[:home][:players][i][:shoe]
    end
      i += 1 
  end
k = 0 
  while k < game[:away][:players].length
    if game[:away][:players][k][:player_name] == name
      size = game[:away][:players][k][:shoe]
    end
    k += 1
  end 
 size
end

def team_colors(team)
game = game_hash
  if game[:home][:team_name] == team
  colors = game[:home][:colors]
  end
  if game[:away][:team_name] == team
  colors = game[:away][:colors]
  end
colors
end 

def team_names 
game = game_hash
teams = [game[:home][:team_name], game[:away][:team_name]]
end 

def player_numbers(team_name)
game = game_hash
jersey_numbers = []
  if game[:home][:team_name] == team_name
  i = 0
    while i < game[:home][:players].length
    jersey_numbers << game[:home][:players][i][:number]
    i += 1
    end
  end
  if game[:away][:team_name] == team_name
  k = 0 
    while k < game[:away][:players].length
    jersey_numbers << game[:away][:players][k][:number]
    k += 1 
    end
  end
  jersey_numbers
end 

def player_stats(name)
game = game_hash
stats = {}
i = 0 
  while i < game[:home][:players].length
    if game[:home][:players][i][:player_name] == name
      stats = game[:home][:players][i]
    end
      i += 1 
  end
k = 0 
  while k < game[:away][:players].length
    if game[:away][:players][k][:player_name] == name
      stats = game[:away][:players][k]
    end
    k += 1
  end 
 stats.delete(:player_name)
 stats
end

def big_shoe_rebounds
game = game_hash
biggest_size = game[:home][:players][0][:shoe]
largest_foot_player = game[:home][:players][0][:player_name]
rebounds = []
i = 0 
  while i < game[:home][:players].length
    if game[:home][:players][i][:shoe] > biggest_size
    biggest_size = game[:home][:players][i][:shoe]
    largest_foot_player = game[:home][:players][i][:player_name]
    end
    i += 1
  end 
k = 0 
  while k < game[:away][:players].length
    if game[:away][:players][k][:shoe] > biggest_size
    biggest_size = game[:away][:players][k][:shoe]
    largest_foot_player = game[:away][:players][k][:player_name]
    end
    k += 1 
  end
j = 0 
  while j < game[:home][:players].length
    if game[:home][:players][j][:player_name] == largest_foot_player
    rebounds = game[:home][:players][j][:rebounds]
    end
  j += 1 
  end
l = 0 
  while l < game[:away][:players].length
    if game[:away][:players][l][:player_name] == largest_foot_player
    rebounds = game[:away][:players][l][:rebounds]
    end
    l += 1
  end
  rebounds
end 

# p big_shoe_rebounds

def most_points_scored
game = game_hash
most_points = game[:home][:players][0][:points]
most_points_player = game[:home][:players][0][:player_name]
i = 0 
  while i < game[:home][:players].length
    if game[:home][:players][i][:points] > most_points
    most_points = game[:home][:players][i][:points]
    most_points_player = game[:home][:players][i][:player_name]
    end
    i += 1
  end 
k = 0 
  while k < game[:away][:players].length
    if game[:away][:players][k][:points] > most_points
    most_points = game[:away][:players][k][:points]
    most_points_player = game[:away][:players][k][:player_name]
    end
    k += 1 
  end
  most_points_player
end

# p most_points_scored

def winning_team
game = game_hash
total_home = 0 
  i = 0 
  while i < game[:home][:players].length
    total_home += game[:home][:players][i][:points]
    i += 1 
  end
  total_away = 0 
  k = 0 
  while k< game[:away][:players].length 
    total_away += game[:away][:players][k][:points]
    k += 1 
  end 
  if total_away > total_home
    return game[:away][:team_name]
  elsif total_home > total_away
    return game[:home][:team_name]
  else 
    return "It's a tie!"
  end 
end

# p winning_team

def player_with_longest_name
game = game_hash
longest_name = game[:home][:players][0][:player_name] 
  i = 0 
  while i < game[:home][:players].length
    if game[:home][:players][i][:player_name].length > longest_name.length
      longest_name = game[:home][:players][i][:player_name]
    end
   i += 1 
  end
  total_away = 0 
  k = 0 
  while k< game[:away][:players].length 
    if game[:away][:players][k][:player_name].length > longest_name.length
      longest_name = game[:away][:players][k][:player_name]
    end
    k += 1 
  end 
  longest_name
end

# p player_with_longest_name

def long_name_steals_a_ton?
player_with_longest_name
game = game_hash
most_steals_player = game[:home][:players][0][:player_name] 
most_steals = game[:home][:players][0][:steals]
   i = 0 
  while i < game[:home][:players].length
    if game[:home][:players][i][:steals] > most_steals
      most_steals = game[:home][:players][i][:steals]
      most_steals_player = game[:home][:players][i][:player_name]
    end
   i += 1 
  end
  total_away = 0 
  k = 0 
  while k < game[:away][:players].length 
    if game[:away][:players][k][:steals] > most_steals
      most_steals = game[:away][:players][k][:steals]
      most_steals_player = game[:away][:players][k][:player_name]
    end
    k += 1 
  end 
  if most_steals_player == player_with_longest_name
    return true 
  else 
    return false 
  end 
end

# p long_name_steals_a_ton?
