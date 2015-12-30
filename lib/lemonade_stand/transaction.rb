module LemonadeStand
  class Transaction

    attr_reader :amount, :transaction

    def initialize(config)
      @transaction = config[:transaction]
      @amount = config[:amount]
    end
  end
end
