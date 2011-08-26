class Replay < ActiveRecord::Base
  mount_uploader :replay, ReplayUploader
  
  GAME_TYPES = {
    0 => "Other",
    1 => "1vs1",
    2 => "2vs2",
    3 => "3vs3",
    4 => "4vs4"
    
  }
  validates :uploader, :game_type, :map_id, :title, :presence => true
  
  belongs_to :map
  has_many :players
  
  def replay=(obj)
    super(obj)
  end
  
  def type_name
    GAME_TYPES[self.game_type]
  end
  
  def map_name
    return Map.find(self.map_id)[:name]
  end
end
