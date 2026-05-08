module Games
  class Initialize
    include Dry::Monads[:result]
    include Dry::Monads::Do.for(:call)

    def self.call(...) = new(...).call

    def initialize(card_ids:, user: nil, first_player: nil)
      @card_ids = card_ids
      @user = user
      @first_player = first_player
    end

    def call
      Game.transaction do
        create_game
        yield initialize_player
      end
      Success(game)
    end

    private

    attr_reader :game, :card_ids, :user, :first_player

    def create_game
      @game = Game.create!
    end

    def initialize_player
      Players::Initialize.call(game:, card_ids:, user:, first_player:)
    end
  end
end
