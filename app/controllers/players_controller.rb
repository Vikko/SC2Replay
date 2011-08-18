class PlayersController < ApplicationController
  def new
    find_replay
    @player = @replay.players.build
  end
  
  def create
    find_replay
    @player = @replay.players.build(params[:player])
    if @player.save
      redirect_to new_replay_player_path(@replay), :notice => "Player added."
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to (request.env["HTTP_REFERER"] || replay_path(@player.replay))
  end

  private 
  def find_replay
    @replay = Replay.find(params[:replay_id])
  end  
end