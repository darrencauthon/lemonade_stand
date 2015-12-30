module LemonadeStand
  class Choice

    def initialize(config)
      @player_id = config[:player_id]
      @round_id  = config[:round_id]
      @player    = config[:player]
    end

    def buy qty
      @buy = qty
    end

    def inventory
      @buy
    end

    def set_retail price
      @price = price
    end

    def retail
      @price
    end

    def buy_signs quanity
      @signs = quanity
    end

    def signs
      @signs
    end

    def cost_of_goods
      day.cost_of_goods
    end

    def day
      @day ||= Day.new
    end

    def check_balance
      "  • bank bal. $#{@player.balance}"
    end

    def crunch_the_numbers
      "  • total glasses (without signs)"
    end

    def purchase_inventory
      puts " "
      print "Glasses > "
      @glasses_made = gets.chomp.to_i
      puts "PLACE ORDER: #{@glasses_made} Glasses"
    end

    def advertising_budget
      puts " "
      print "Signs > "
      @glasses_made = gets.chomp.to_i
    end

    def set_retail_price
      puts " "
      print "RETAIL PRICE > "
      @price_per_glass = gets.chomp.to_i
      puts "PRICE: #{@price_per_glass}"
      puts "POTENTIAL PROFIT: #{projected_gross_profit}"
    end

    def projected_gross_profit
      @price_per_glass * @glasses_made
    end

  private

    def make_choices
      puts " "
      puts " Player #{@player_id} is up."
      puts ""
      puts "   STATE OF AFFAIRS"
      puts " "
      puts check_balance
      puts crunch_the_numbers
      purchase_inventory
      advertising_budget
      set_retail_price
      puts " "
      puts " _ _ _ _ _ _ _ _ _ "
    end
  end
end
