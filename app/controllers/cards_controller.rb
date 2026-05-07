class CardsController < ApplicationController
  before_action :set_card, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy] # TODO: Admin only

  def index
    @cards = Card.all
  end

  def show; end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.factions = Faction.where(id: faction_ids) if faction_ids.present?
    if @card.save
      redirect_to @card, notice: "Card created successfully"
    else
      render :new
    end
  end

  def edit; end

  def update
    @card.factions = Faction.where(id: faction_ids) if faction_ids.present?
    if @card.update(card_params)
      redirect_to @card, notice: "Card updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path, notice: "Card deleted successfully"
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :description, :action, :rarity, :strength)
  end

  def faction_ids
    params[:card][:factions]&.reject(&:blank?)&.map(&:to_i)
  end
end
