module LemonadeStand
  class Game

    attr_reader :gamemaster

    def initialize gamemaster
      @gamemaster = gamemaster
    end

    def play days
      gamemaster.rounds_to_play.times do |day|
        puts LemonadeStand::Day.new(day, days).forecast
        gamemaster.all_players.each do |player|
          player_turn player
        end
        gamemaster.remaining_rounds(day - 1) # _dw FIX
      end
    end

    def player_turn player
      puts "#{player.name} is up."
      puts "You have a balance of #{player.balance}."
      player_move_dw(player)
    end

    def player_move_dw player # _dw temp method
      @choice ||= LemonadeStand::Choice.new(player)
      # puts "How many glasses of lemonade do you want to make?"
      # choice.glasses_made = gets.chomp.to_i
      # puts "How much will you charge per glass?"
      # choice.price_per_glass = gets.chomp.to_i
      # player.choose choice
    end

    # def days
    #   @days ||= []
    # end

    # def start_a_new_day
    #   LemonadeStand::Day.new.tap do |day|
    #     days << day
    #     day.number = days.count
    #   end
    # end

    # def store_sales_results_for results, player, day
    #   sales_results << { player: player, day: day, results: results }
    # end

    # def sales_results_for player, day
    #   sales_results.select do |record|
    #     record[:player].object_id == player.object_id && record[:day].object_id == day.object_id
    #   end.first[:results]
    # end

    # def players
    #   @players ||= (0...@number_of_players).each do |i|
    #                  LemonadeStand::Player.new(i, self)
    #                end
    # end

    # private

    # def sales_results
    #   @sales_results ||= []
    # end
  end
end
