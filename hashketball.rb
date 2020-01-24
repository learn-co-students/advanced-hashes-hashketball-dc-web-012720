# Write your code here!
require 'pry'
require 'pp'

def game_hash()
  hash = {
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
        }
      ]
    }
  }
  
  hash
end

#
# helper functions
#
#
#

def find_player_value(player_name, game_hash, key)
  #returns a specific key value from hash
  game_hash.each_key do |team|
    count = 0
    
    game_hash[team].each do |key, value|
      
      if key == :players
      end
    end
    
    
    while count < game_hash[team][:players].length do
      player = game_hash[team][:players][count]
      if player[:player_name] == player_name
        return player[key]
      end
      count += 1
    end
  end
end

#
#
#
#
#

#puts game_hash[:away][:players][0][:player_name] == "Jeff Adrien"
def num_points_scored(player_name)
  return find_player_value(player_name, game_hash, :points)
end

def shoe_size(player_name)
  return find_player_value(player_name, game_hash, :shoe)
end

def team_colors(team_name) 
  array = []
  
  game_hash.each_key do |team|
    if game_hash[team][:team_name] == team_name
      count = 0
      
      while count < game_hash[team][:colors].length do
        array << game_hash[team][:colors][count]
        count += 1
      end
    end
  end
  
  array
end

def team_names()
  name = []
  
  game_hash.each_key {|team| name << game_hash[team][:team_name] }
  
  name
end

#puts game_hash[:home][:players][0][:number]
def player_numbers(team_name)
    numbers = []
    
    game_hash.each_key do |team|
      if game_hash[team][:team_name] == team_name
        count = 0
        
        while count < game_hash[team][:players].length do
          numbers << game_hash[team][:players][count][:number]
          count += 1
        end
      end
    end
    
    numbers
end

def player_stats(player_name)
  stats = {}
  
  game_hash.each_key do |team|
    count = 0
    while count < game_hash[team][:players].length do
      if game_hash[team][:players][count][:player_name] == player_name
        player = game_hash[team][:players][count]
        
        player.each_pair {|key, value| stats[key] = value}
        stats.delete(player_name)
      end
      count += 1
    end
  end
  
  stats.delete(:player_name)
  stats
end

def big_shoe_rebounds()
  shoe_size = 0
  num_rebounds = 0
  
  game_hash.each_key do |team|
    count = 0
    while count < game_hash[team][:players].length do
      player = game_hash[team][:players][count]
      if player[:shoe] > shoe_size
        shoe_size = player[:shoe]
        num_rebounds = player[:rebounds]
      end
      count += 1
    end
    
    return num_rebounds
  end
end

#
#
# bonus
#
#

def most_points_scored()
  #returns the name of the player who scored the most
  most_points = 0
  name = ""
  
  game_hash.each_key do |team|
    game_hash[team].each_key do |teammates|
      #binding.pry
      if teammates == :players
        i = 0
      
        while i < game_hash[team][teammates].length do
          player = game_hash[team][teammates][i]
          if player[:points] > most_points
            name = player[:player_name]
            most_points = player[:points]
          end
          i += 1
        end
      end
    end
  end
  
  name
end

def winning_team()
  team_name = "Brooklyn Nets"
  total = 0
  winner = [0]
  
  game_hash.each_key do |team|
    i = 0
    while i < game_hash[team][:players].length do
      player = game_hash[team][:players][i]
      
      total += find_player_value(player[:player_name], game_hash, :points)
      i += 1
    end
  end
  
  team_name
end

def player_with_longest_name()
  name_length = 0
  player_name = ""
  
  game_hash.each_key do |team|
    i = 0
    
    while i < game_hash[team][:players].length do
      player = game_hash[team][:players][i]
      
      if player[:player_name].length > name_length
        name_length = player[:player_name].length
        player_name = player[:player_name]
      end
      i += 1
    end
  end
  
  player_name
end

def long_name_steals_a_ton?()
  long_name = player_with_longest_name()
  long_name_steals = find_player_value(long_name, game_hash, :steals)
  
  game_hash.each_key do |team|
    i = 0
    
    while i < game_hash[team][:players].length do
      player = game_hash[team][:players][i]
      
      if player[:steals] > long_name_steals
        return false
      end
      i += 1
    end
  end
  
  true
end

