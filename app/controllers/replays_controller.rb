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
      if p[:race] == :terran
        player.race = 1
      else
        if p[:race] == :zerg
          player.race = 2
        else 
          if p[:race] = :protoss
            player.race = 3
          end
        end
      end
    end
    
    #add meta data
    @replay.game_played_at = replayfile.start_date
    @replay.game_type = replayfile.game_type
    
    if @replay.save
      redirect_to replay_path(@replay), :notice => "Replay created, add players now"
    else
      render :edit
    end
  end
end