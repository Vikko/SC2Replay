class Player < ActiveRecord::Base
  RACES = {
    1 => "Terran",
    2 => "Zerg", 
    3 => "Protoss"
  }
  
  TEAMS = {
    false => "Team 1",
    true => "Team 2"
  }

  belongs_to :replay

  def race_name
    RACES[self.race_id]
  end
  
  def team_name
    TEAMS[self.team]
  end
end
