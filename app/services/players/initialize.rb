module Players
  class Initialize
    include Dry::Monads[:result]
    include Dry::Monads::Do.for(:call)

    def self.call(...) = new(...).call

    def initialize(game:, card_ids:, user: nil, first_player: nil)
      @game = game
      @card_ids = card_ids
      @user = user
      @first_player = first_player
    end

    def call
      yield check_number_of_game_players
      yield check_number_of_cards
      create_player
      create_play_cards
      Success(player)
    end

    private

    attr_reader :game, :card_ids, :user, :first_player, :player

    def check_number_of_game_players
      return Failure("Game already has 2 players") if game.players.count > 1

      Success()
    end

    def check_number_of_cards
      return Failure("Not enough cards in a deck") if card_ids.size < Game::MINIMUM_CARDS_PER_DECK

      Success()
    end

    def create_player
      @player = Player.create!(game: game, user: user, first_player: first_player_value)
    end

    def create_play_cards
      card_ids.each do |card_id|
        player.play_cards.create!(card_id: card_id)
      end
    end

    def first_player_value
      if game.players.one?
        !game.players.first.first_player
      elsif first_player.nil?
        random_boolean
      else
        first_player
      end
    end

    def random_boolean
      [true, false].sample
    end
  end
end
