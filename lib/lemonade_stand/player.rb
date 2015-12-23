module LemonadeStand

  class Player

    # attr_accessor :index, :game, :assets

    def initialize(index='1')
      @index = index
      @assets = 200
    end

    def choose choice
      game.make_choice choice, { player: self }
    end

    def name
      'billy bob'
    end

    def balance
      bank.balance
    end

    def bank
      @bank ||= LemonadeStand::Bank.new(@assets)
    end

  end
end
