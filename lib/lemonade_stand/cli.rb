module LemonadeStand

  class CLI

    def initialize argv
      @argv = argv
    end

    def play

      if @argv.include?('-v')
        puts LemonadeStand::VERSION
        exit
      end

      puts 'How many players are playing?'
      number_of_players = gets.chomp.to_i

      puts 'How many days will this game last?'
      number_of_days = gets.chomp.to_i

      game = LemonadeStand::Game.new number_of_players

      (1..number_of_days).each do |day|

        game.start_a_new_day

        game.players.each do |player|
          puts "Player #{player.index} is up!!!"

          puts "You have #{player.assets} pennies."

          choice = LemonadeStand::Choice.new

          puts "How many glasses of lemonade do you want to make?"
          choice.glasses_made = gets.chomp.to_i

          puts "How much will you charge per glass?"
          choice.price_per_glass = gets.chomp.to_i

          player.choose choice

        end

        game.players.each do |player|
          puts "Player #{player.index} ended the day with: #{player.assets}"
        end

      end

      puts "The game is over!"
      winner = game.players.sort_by { |x| x.assets }[-1]

      puts "The winner is: Player #{winner.index}"

    end

  end

end
