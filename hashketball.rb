def game_hash
  hash = {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players => [
        {:player_name => 'Alan Anderson',
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },  
        {:player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        },
        {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },
        {:player_name => 'Mason Plumlee',
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },
        {:player_name => 'Jason Terry',
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
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
      :players => [
        {:player_name => 'Jeff Adrien',
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },
        {:player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
        },
        {:player_name => 'DeSagna Diop',
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },
        {:player_name => 'Ben Gordon',
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0  
        },
        {:player_name => 'Kemba Walker',
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

def num_points_scored(player_name)
  game_hash.each {|key, value| 

    value[:players].each { |player|
    
      if player[:player_name] == player_name
       return player[:points]
      end
    }
  }
  
end

def shoe_size(player_name)
  game_hash.each {|key, value| 

    value[:players].each { |player|
    
      if player[:player_name] == player_name
       return player[:shoe]
      end
    }
  }
end

def team_colors(team_name)
  game_hash.each { |key, value|
    if team_name == value[:team_name]
      return value[:colors]
    end
  }
end

def team_names
  arr = []
  game_hash.each { |key, value| 
    arr << value[:team_name]
  }
  p arr
  arr
end

def player_numbers(team_name)
  arr = []
  game_hash.each { |key, value| 
    if team_name == value[:team_name]
      value[:players].each { |player|
        arr << player[:number]
        }
      p arr
      return arr
    end
  }
end

def player_stats(player_name)
  hash = {:number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      }
  game_hash.each { |key, value|
    # p key
    # p value[:players]
    value[:players].each { |player|
    if player_name == player[:player_name]
      hash[:number] = player[:number]
      hash[:shoe] = player[:shoe]
      hash[:points] = player[:points]
      hash[:rebounds] = player[:rebounds]
      hash[:assists] = player[:assists]
      hash[:steals] = player[:steals]
      hash[:blocks] = player[:blocks]
      hash[:slam_dunks] = player[:slam_dunks]
      # p hash
      return hash
    end
    }
  }
end

def big_shoe_rebounds
  sizes = []
  game_hash.each { |key, value| 
    value[:players].each { |player|
      sizes << player[:shoe]
    }
  }
  biggest = sizes.max
  p biggest
  game_hash.each { |key, value| 
    value[:players].each { |player|
    if biggest == player[:shoe]
      p player[:player_name]
      p player[:rebounds]
      return player[:rebounds]
    end
    }
  }
end

def most_points_scored
  points = []
  game_hash.each { |key, value| 
    value[:players].each { |player|
      points << player[:points]
    }
  }
  most = points.max
  p most
  game_hash.each { |key, value| 
    value[:players].each { |player|
    if most == player[:points]
      p player[:player_name]
      p player[:points]
      return player[:player_name]
    end
    }
  }
end

def winning_team
  team1 = []
  team2 = []
  game_hash.each { |key, value| 
    if key == :home
      value[:players].each { |player|
        team1 << player[:points]
      }
    else
      value[:players].each { |player|
        team2 << player[:points]
      }
    end
  }
  
  team1_total = team1.inject { |sum, n| sum + n}
  team2_total = team2.inject { |sum, n| sum + n}
  
  if team1_total > team2_total
    p game_hash[:home][:team_name]
    return game_hash[:home][:team_name]
  else 
    p game_hash[:away][:team_name]
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  names = []
  game_hash.each { |key, value| 
    value[:players].each { |player|
      names << player[:player_name]
    }
  }
  longest_name = names.max_by(&:length)
  p longest_name
  longest_name
end

def most_steals
  steals = []
  game_hash.each { |key, value| 
    value[:players].each { |player|
      steals << player[:steals]
    }
  }
  most = steals.max
  p most
  game_hash.each { |key, value| 
    value[:players].each { |player|
    if most == player[:steals]
      p player[:player_name]
      p player[:steals]
      return player[:player_name]
    end
    }
  }
end

def long_name_steals_a_ton?
  if player_with_longest_name == most_steals
    return true 
  end
end








