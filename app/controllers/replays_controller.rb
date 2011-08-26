class ReplaysController < ApplicationController
  def index
    @replays = Replay.all
  end
  
  def new
    @replay = Replay.new
  end
  
  def show
    @replay = Replay.find(params[:id])
  end
  
  def edit
    @replay = Replay.find(params[:id])
  end
  
  def destroy
    @replay = Replay.find(params[:id])
    @replay.destroy
    redirect_to root_path
  end
  
  def create
    @replay = Replay.new(params[:replay])
    require 'replay_file'
    replayfile = MPQ::SC2ReplayFile.new(File.open(@replay.replay.current_path))
    
    #add players
    firstteam = "none"
    if replayfile.players != nil
      replayfile.players.each do |p| #p name, outcome, type, race, color
        player = @replay.players.build
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
    @replay.game_played_at = replayfile.start_date
    @replay.game_type = replayfile.game_type
    
    #find map
    map = Map.find_or_create_by_name(replayfile.map_name)
    @replay.map_id = map.id
    
    if @replay.save
      redirect_to replay_path(@replay), :notice => "Replay created, add players now"
    else
      render :edit
    end
  end
end