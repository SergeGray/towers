class FactionsController < ApplicationController
  before_action :set_faction, only: %i[show edit update destroy]
  before_action :authenticate_admin!, only: %i[new create edit update destroy]

  def index
    @factions = Faction.all
  end

  def show; end

  def new
    @faction = Faction.new
  end

  def create
    @faction = Faction.new(faction_params)
    @faction.cards = Card.where(id: card_ids) if card_ids.present?
    if @faction.save
      redirect_to @faction, notice: "Faction created successfully"
    else
      render :new
    end
  end

  def edit; end

  def update
    @faction.cards = Card.where(id: card_ids) if card_ids.present?
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

  def card_ids
    params[:faction][:cards]&.reject(&:blank?)&.map(&:to_i)
  end
end
