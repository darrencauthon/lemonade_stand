require_relative '../spec_helper'

describe LemonadeStand::Event do

  describe "for" do

    let(:day)     { Struct.new(:weather).new weather }
    let(:weather) { Object.new }

    before do
      weather.stubs(:cloudy?).returns false
      weather.stubs(:hot_and_dry?).returns false
      weather.stubs(:sunny?).returns false
    end

    describe "and the weather is cloudy" do

      before { weather.stubs(:cloudy?).returns true }

      it "should return a cloudy event" do
        cloudy_event = Object.new
        LemonadeStand::Event.stubs(:cloudy_event).returns cloudy_event
        result = LemonadeStand::Event.for(day)
        result.must_be_same_as cloudy_event
      end

    end

    describe "and the weather is hot and dry" do

      before { weather.stubs(:hot_and_dry?).returns true }

      it "should return a hot and dry event" do
        event = Object.new
        LemonadeStand::Event.stubs(:hot_and_dry_event).returns event
        result = LemonadeStand::Event.for(day)
        result.must_be_same_as event
      end

    end

    describe "a sunny day" do

      before { weather.stubs(:sunny?).returns true }

      it "should return a sunny event" do
        event = Object.new
        LemonadeStand::Event.stubs(:sunny_event).returns event
        result = LemonadeStand::Event.for(day)
        result.must_be_same_as event
      end

    end

  end

  describe "a sunny event" do

    let(:day) { Struct.new(:number).new 0 }

    (0...25).to_a.each do |random_value|
      describe "random 0-99 is #{random_value}" do

        before { LemonadeStand::Event.stubs(:rand).with(100).returns random_value }

        [1, 2].each do |day_number|
          describe "and the day number is #{day_number}" do
            
            before { day.stubs(:number).returns day_number }

            it "should return a normal work event" do
              event = Object.new
              LemonadeStand::Event.stubs(:build).with(:normal).returns event
              result = LemonadeStand::Event.sunny_event_for day
              result.must_be_same_as event
            end

          end
        end

        (3..10).to_a.each do |day_number|
          describe "and the day number is #{day_number}" do
            
            before { day.stubs(:number).returns day_number }

            it "should return a normal event" do
              event = Object.new
              LemonadeStand::Event.stubs(:build).with(:street_work).returns event
              result = LemonadeStand::Event.sunny_event_for day
              result.must_be_same_as event
            end

          end
        end

      end
    end

    (25..100).to_a.each do |random_value|
      describe "random 0-99 is #{random_value}" do
        before { LemonadeStand::Event.stubs(:rand).with(100).returns random_value }

        describe "and day is 3" do
          before { day.number = 3 }

          it "should return a normal day" do
            event = Object.new
            LemonadeStand::Event.stubs(:build).with(:normal).returns event
            result = LemonadeStand::Event.sunny_event_for day
            result.must_be_same_as event
          end
        end

      end
    end

  end

end
