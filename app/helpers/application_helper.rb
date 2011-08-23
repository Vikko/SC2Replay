module ApplicationHelper
  def race_collection
    Player::RACES.collect{|x, v| [v, x]}
  end
  
  def team_collection
     Player::TEAMS.collect{|x, v| [v, x]}
  end
  
  def type_collection
     Replay::GAME_TYPES.collect{|x, v| [v, x]}
  end
end
