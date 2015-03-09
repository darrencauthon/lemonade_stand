module LemonadeStand

  class Game

    def initialize number_of_players
      @number_of_players = number_of_players
    end

    def make_choice choice, options
      player  = options[:player]
      day     = options[:day] || days.last
      results = day.sales_for choice

      player.assets += results.profit
      store_sales_results_for results, player, day
    end

    def days
      @days ||= []
    end

    def start_a_new_day
      LemonadeStand::Day.new.tap do |day|
        days << day
        day.number = days.count
      end
    end

    def store_sales_results_for results, player, day
      sales_results << { player: player, day: day, results: results }
    end

    def sales_results_for player, day
      sales_results.select do |record|
        record[:player].object_id == player.object_id && record[:day].object_id == day.object_id
      end.first[:results]
    end

    def players
      @players ||= (0...@number_of_players).map do |i|
                     LemonadeStand::Player.new.tap do |p|
                       p.index = i
                       p.game  = self
                     end
                   end
    end

    private

    def sales_results
      @sales_results ||= []
    end

  end

end
