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
  validates :name, :race, :team, :presence => true


  def race_name
    RACES[self.race]
  end
  
  def team_name
    TEAMS[self.team]
  end
  
  def is_winner?
    return (self.replay.winning_team == self.team)
  end
  
end
