module Games
  class Start
    include Dry::Monads[:result]
    include Dry::Monads::Do.for(:call)

    def self.call(...) = new(...).call

    def initialize(game:, card_ids:, user: nil)
      @game = game
      @card_ids = card_ids
      @user = user
    end

    def call
      Game.transaction do
        yield initialize_player
        change_game_status
      end
      Success(game)
    end

    private

    attr_reader :game, :card_ids, :user

    def initialize_player
      Players::Initialize.call(game:, card_ids:, user:)
    end

    def change_game_status
      game.update!(state: :in_progress)
    end
  end
end
