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

    let(:game) { LemonadeStand::Game.new 2 }

    let(:choice)      { Object.new }

    before do
      game.start_a_new_day
      game.start_a_new_day
      game.start_a_new_day
    end

    describe "multiple days and players" do

      [0, 1, 2].each do |day_index|

        [0, 1].each do |player_index|

          describe "day #{day_index}" do

            let(:day) { game.days[day_index] }

            let(:player) { game.players[player_index] }

            let(:sales_results) { Struct.new(:profit).new 0 }

            let(:other_day)    { game.days.select    { |d| d != day    }.first }
            let(:other_player) { game.players.select { |p| p != player }.first }

            before do

              other_day.stubs(:sales_for).returns Struct.new(:profit).new(0)
              day.stubs(:sales_for).returns Struct.new(:profit).new(0)

              # other moves have been made
              game.make_choice Object.new, { player: player,       day: other_day }
              game.make_choice Object.new, { player: other_player, day: day }

              day.stubs(:sales_for).with(choice).returns sales_results

            end

            it "should calculate the sales results" do
              game.make_choice choice, { player: player, day: day }
              game.sales_results_for(player, day).must_be_same_as sales_results
            end

            describe "changing the players assets after the results are made" do
              [
                [200, 100, 300],
                [100, 221, 321],
              ].map { |x| Struct.new(:assets, :profit, :expected).new(*x) }.each do |example|
                describe "multiple examples" do
                  before do
                    player.assets = example.assets
                    sales_results.stubs(:profit).returns example.profit
                    day.stubs(:sales_for).with(choice).returns sales_results
                  end
                  it "should add the profit to the assets" do
                    game.make_choice choice, { player: player, day: day }
                    player.assets.must_equal example.expected
                  end
                end
              end
            end

            describe "sales results for" do
              it "should not return the same results than the one we just checked" do
                game.make_choice Object.new, { player: player, day: day }
                game.sales_results_for(player, other_day).wont_be_same_as sales_results 
                game.sales_results_for(other_player, day).wont_be_same_as sales_results
              end
            end

          end

        end

      end

      describe "making a choice without defining the day" do

        let(:game)   { LemonadeStand::Game.new 1 }
        let(:choice) { Object.new }
        let(:player) { game.players.first }
        
        let(:expected_results) { Struct.new(:profit).new 0 }

        let(:day) do
          d = Object.new
          d.stubs(:sales_for).returns expected_results
          d
        end

        before do
          game.stubs(:days).returns Struct.new(:last).new(day)
        end

        it "should default to using the last day" do
          game.make_choice choice, { player: player }
          game.sales_results_for(player, day).must_be_same_as expected_results
        end

      end

    end

  end

  describe "days" do

    let(:game) { LemonadeStand::Game.new 1 }

    it "should start with no days" do
      game.days.count.must_equal 0
    end

    describe "start a new day" do

      it "should create a new day" do
        game.start_a_new_day
        game.days.count.must_equal 1
        game.days.first.is_a?(LemonadeStand::Day).must_equal true
      end

      it "should return the day" do
        result = game.start_a_new_day
        result.must_be_same_as game.days.first
      end

      it "should set the day number to 1" do
        game.start_a_new_day
        game.days.first.number.must_equal 1
      end

      describe "starting a new day" do
        it "should create two new days" do
          game.start_a_new_day
          game.start_a_new_day
          game.days.count.must_equal 2
          game.days.first.is_a?(LemonadeStand::Day).must_equal true
          game.days.last.is_a?(LemonadeStand::Day).must_equal true
        end

        it "should return the latest day" do
          game.start_a_new_day
          result = game.start_a_new_day
          result.must_be_same_as game.days.last
        end

        it "should set the day numbers" do
          game.start_a_new_day
          game.start_a_new_day
          game.days.first.number.must_equal 1
          game.days.last.number.must_equal 2
        end
      end
    end

  end

end
