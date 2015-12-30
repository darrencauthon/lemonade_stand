module LemonadeStand
  class Bank

    def initialize(config)
      @assets = config[:assets]
      @player = config[:player]
      @transactions = []
    end

    def deposit(amount)
      @transactions << transaction('debit', amount)
    end

    def last_transaction
      {
        transaction: @transactions.last.transaction,
        amount: @transactions.last.amount
      }
    end

    def balance
      transactions = @transactions.inject([]) do |memo, t|
        memo << t.amount
        memo
      end
      transactions << current_balance
      transactions.reduce(:+)
    end

    def money
      (@assets.to_f / 100.to_f).round(2)
    end

  private

    def current_balance
      @assets
    end

    def transaction(transaction, amount)
      @transaction ||= LemonadeStand::Transaction.new({
        account: @player.id,
        transaction: transaction,
        amount: amount
        })
    end
  end
end
