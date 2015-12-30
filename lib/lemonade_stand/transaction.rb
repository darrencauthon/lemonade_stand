module LemonadeStand
  class Transaction

    attr_reader :amount, :transaction, :account_id

    def initialize(config)
      @transaction = config[:transaction]
      @amount      = config[:amount]
      @account_id  = config[:account_id]
    end
  end
end
