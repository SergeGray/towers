class DecksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck, only: %i[show edit update destroy]

  def index
    @decks = current_user.decks
  end

  def show; end

  def new
    @deck = current_user.decks.new
  end

  def create
    @deck = current_user.decks.new(deck_params)
    @deck.cards = Card.where(id: card_ids)
    if @deck.save
      redirect_to @deck, notice: "Deck created successfully"
    else
      render :new
    end
  end

  def edit; end

  def update
    binding.break
    @deck.cards = Card.where(id: card_ids)
    if @deck.update(deck_params)
      redirect_to @deck, notice: "Deck updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @deck.destroy
    redirect_to decks_path, notice: "Deck deleted successfully"
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end

  def set_deck
    @deck = current_user.decks.find(params[:id])
  end

  def card_ids
    params[:deck][:cards].reject(&:blank?).map(&:to_i)
  end
end
