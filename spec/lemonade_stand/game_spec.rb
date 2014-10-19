require_relative '../spec_helper'

describe LemonadeStand::Game do

  describe "creating a game" do

    [
      [4],
      [3],
    ].map { |x| Struct.new(:player_count).new *x }.each do |example|

      describe "multiple examples" do

        let(:game) { LemonadeStand::Game.new example.player_count }

        describe "players" do

          it "should require the number of players" do
            game.players.count.must_equal example.player_count
          end

          it "should return player objects for each player" do
            game.players.each { |p| p.is_a?(LemonadeStand::Player).must_equal true }
          end

          it "should return the same player objects each time" do
            results      = game.players
            more_results = game.players
            results.each_with_index do |player, index|
              player.must_be_same_as more_results[index]
            end
          end


          it "should set the player index on each as an incrementing index" do
            game.players.each_with_index do |player, index|
              player.index.must_equal index
            end
          end

          it "should set the game on the player" do
            game.players.each do |player|
              player.game.must_be_same_as game
            end
          end

        end

      end

    end

  end

  describe "making a choice" do

    let(:game) { LemonadeStand::Game.new 1 }

    let(:player)      { Struct.new(:index).new(1) }
    let(:choice)      { Object.new }

    describe "multiple days" do

      [0, 1].each do |day_index|

        describe "and the game is on day #{day_index}" do

          let(:day) { Object.new }

          let(:sales_results) { Object.new }

          it "should calculate the sales results" do
            LemonadeStand::Calculation
              .stubs(:calculate_sales)
              .with(day, choice)
              .returns sales_results

            game.make_choice choice, { player: player, day: day }

            game.sales_results_for(player, day).must_be_same_as sales_results
          end

        end

      end

    end

  end

end
