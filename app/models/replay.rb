class Replay < ActiveRecord::Base
  mount_uploader :replay, ReplayUploader
  
  GAME_TYPES = {
    1 => "1vs1",
    2 => "2vs2",
    3 => "3vs3",
    4 => "4vs4",
    0 => "Other"
  }
  validates :game_type, :map_id, :title, :presence => true
  
  belongs_to :map
  has_many :players
  
  def replay=(obj)
    super(obj)
  end
end
