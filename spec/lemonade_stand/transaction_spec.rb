require_relative '../spec_helper'

describe LemonadeStand::Transaction do
  it 'holds attributes about the transaction' do
    trans = LemonadeStand::Transaction.new({transaction: 'debit', amount: 200, account_id: 1})
    assert_equal 200, trans.amount
    assert_equal 'debit', trans.transaction
    assert_equal 1, trans.account_id
  end
end
