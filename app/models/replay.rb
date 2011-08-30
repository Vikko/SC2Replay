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
  
  before_validation_on_create :load_meta_data_from_replay

  def load_meta_data_from_replay
    begin
      require 'replay_file'
      replayfile = MPQ::SC2ReplayFile.new(File.open(self.replay.current_path))
    
      #add players
      firstteam = "none"
      if replayfile.players.present?
        replayfile.players.each do |p| #p name, outcome, type, race, color
          player = self.players.build

          if p[:type] == :human
            player.name = p[:name]
          else 
            player.name = "Computer"
          end

          if firstteam == "none"
            firstteam = p[:outcome]
          end

          if p[:outcome] == firstteam
            player.team = 0
          else
            player.team = 1
          end

          case p[:race]
          when :terran
            player.race = 1  
          when :zerg
            player.race = 2
          when :protoss
            player.race = 3    
          else 
            player.race = 0
          end
        end
      end
    
      #add meta data
      self.game_played_at = replayfile.start_date
      self.game_type = replayfile.game_type
    
      #find map
      self.map_id = Map.find_or_create_by_name(replayfile.map_name).id
    rescue StandardError => e # We are catching ALL errors here, not best practice but I am not sure which errors we can expect
      Rails.logger.debug("Failed to load meta-data. Error: #{e}")
    end
  end
  
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
