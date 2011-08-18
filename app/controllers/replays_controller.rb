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
  
  def create
    @replay = Replay.new(params[:replay])
    if @replay.save
      redirect_to new_replay_player_path(@replay), :notice => "Replay created, add players now"
    else
      render :edit
    end
  end
end