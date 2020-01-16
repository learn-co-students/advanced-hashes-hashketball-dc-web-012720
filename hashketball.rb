# Write your code here!

def game_hash
  
  thegame = {
  
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
       {
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      
       {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      
       {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      
       {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      
       {
        :player_name => "Jason Terry",
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
  },
  
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      
       {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      
       {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      
       {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      
       {
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      },
     
      ]
  }
  
}
end

def num_points_scored(name)
  all_players = game_hash[:home][:players] + game_hash[:away][:players]
  i = 0
  while i < all_players.count do
    if all_players[i][:player_name] == name
      points_scored_result = all_players[i][:points]
      return points_scored_result
    else
      i += 1
    end
  end
end

def shoe_size(name)
  all_players = game_hash[:home][:players] + game_hash[:away][:players]
  i = 0
  while i < all_players.count do
    if all_players[i][:player_name] == name
      size_of_shoe = all_players[i][:shoe]
      return size_of_shoe.to_i
    else
      i += 1
    end
  end
end

def team_colors(name)
  if game_hash[:home][:team_name] == name
    thecolor = game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == name
    thecolor= game_hash[:away][:colors]
  end
  thecolor
end

def team_names()
  [game_hash[:home][:team_name],  game_hash[:away][:team_name] ]
end

def player_numbers(name)
  playernumberarray = []
  if game_hash[:home][:team_name] == name
    #array of player numbers
    i = 0
    while i < game_hash[:home][:players].count do
      playernumberarray.push(game_hash[:home][:players][i][:number].to_i)
      i += 1
    end
  
  elsif game_hash[:away][:team_name] == name
    #array of player numbers
     i = 0
    while i < game_hash[:away][:players].count do
      playernumberarray.push(game_hash[:away][:players][i][:number].to_i)
      i += 1
    end
  end
  playernumberarray
end

def player_stats(name)
  all_players = game_hash[:home][:players] + game_hash[:away][:players]
  i = 0
  while i < all_players.count do
    if all_players[i][:player_name] == name
      his_stats = all_players[i].reject{|key, _| key == :player_name}
      return his_stats
    else
      i += 1
    end
  end
end

def big_shoe_rebounds()
  all_players = game_hash[:home][:players] + game_hash[:away][:players]
  i = 0
  shoemax_i = 0
  shoemax = all_players[0][:shoe]
   while i < all_players.count do
    if all_players[i][:shoe] > shoemax
      shoemax = all_players[i][:shoe]
      shoemax_i = i
    end
      i += 1
  end
  all_players[shoemax_i][:rebounds]
end

