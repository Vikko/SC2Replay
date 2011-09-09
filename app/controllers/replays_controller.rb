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
    
    @replay.uploader = current_user.email
    
    if @replay.save
      redirect_to replay_path(@replay), :notice => "Replay created, add players now"
    else
      render :edit
    end
  end
  
  def search
    @replays = Replay.search(params[:search])
  end
end