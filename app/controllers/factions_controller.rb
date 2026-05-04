class FactionsController < ApplicationController
  before_action :set_faction, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy] # TODO: Admin only

  def index
    @factions = Faction.all
  end

  def show; end

  def new
    @faction = Faction.new
  end

  def create
    @faction = Faction.new(faction_params)
    if @faction.save
      redirect_to @faction, notice: "Faction created successfully"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @faction.update(faction_params)
      redirect_to @faction, notice: "Faction updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @faction.destroy
    redirect_to factions_path, notice: "Faction deleted successfully"
  end

  private

  def set_faction
    @faction = Faction.find(params[:id])
  end

  def faction_params
    params.require(:faction).permit(:name)
  end
end
