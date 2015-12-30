module LemonadeStand
  class Player

    attr_reader :balance, :id

    def initialize(index=1)
      @id = (index += 1)
      @assets = 200
      @choices = []
    end

    def choose
      round_id = (@choices.size + 1)
      @choices << LemonadeStand::Choice.new({
        player: self,
        player_id: @id,
        round_id: round_id
      })
    end

    def balance
      bank.money
    end

    def profit
      300 # _dw FIX
    end

    def bank
      @bank ||= LemonadeStand::Bank.new({ assets: @assets, player: self })
    end
  end
end
