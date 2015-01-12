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
        LemonadeStand::Event.stubs(:cloudy_event_for).with(day).returns cloudy_event
        result = LemonadeStand::Event.for(day)
        result.must_be_same_as cloudy_event
      end

    end

    describe "and the weather is hot and dry" do

      before { weather.stubs(:hot_and_dry?).returns true }

      it "should return a hot and dry event" do
        event = Object.new
        LemonadeStand::Event.stubs(:hot_and_dry_event_for).with(day).returns event
        result = LemonadeStand::Event.for(day)
        result.must_be_same_as event
      end

    end

    describe "a sunny day" do

      before { weather.stubs(:sunny?).returns true }

      it "should return a sunny event" do
        event = Object.new
        LemonadeStand::Event.stubs(:sunny_event_for).with(day).returns event
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

  describe "a cloudy event" do

    let(:day) { Object.new }

    (0...25).to_a.each do |random_value|
      describe "random 0-99 is #{random_value}" do

        before { LemonadeStand::Event.stubs(:rand).with(100).returns random_value }

        it "should return a normal work event" do
          event = Object.new
          LemonadeStand::Event.stubs(:build).with(:storm).returns event
          result = LemonadeStand::Event.cloudy_event_for day
          result.must_be_same_as event
        end

      end
    end

    (25..100).to_a.each do |random_value|
      describe "random 0-99 is #{random_value}" do

        before { LemonadeStand::Event.stubs(:rand).with(100).returns random_value }

        it "should return a normal day" do
          event = Object.new
          LemonadeStand::Event.stubs(:build).with(:rain).returns event
          result = LemonadeStand::Event.cloudy_event_for day
          result.must_be_same_as event
        end

      end
    end

  end

  describe "a hot and dry event" do
    it "should return a heat wave" do
      event = Object.new
      LemonadeStand::Event.stubs(:build).with(:heat_wave).returns event
      result = LemonadeStand::Event.hot_and_dry_event_for nil
      result.must_be_same_as event
    end
  end

  describe "build" do
    [
      [:rain, LemonadeStand::RainEvent],
      [:storm, LemonadeStand::StormEvent],
      [:heat_wave, LemonadeStand::HeatWaveEvent],
      [:street_work, LemonadeStand::StreetWorkEvent],
      [:normal, LemonadeStand::NormalEvent],
    ].map { |x| Struct.new(:type, :klass).new *x }.each do |example|
      describe "building #{example.type}" do
        it "should create an #{example.klass}" do
          LemonadeStand::Event.build(example.type)
            .is_a?(example.klass).must_equal true
        end
      end
    end
  end

  [
    LemonadeStand::RainEvent,
    LemonadeStand::StormEvent,
    LemonadeStand::HeatWaveEvent,
    LemonadeStand::StreetWorkEvent,
    LemonadeStand::NormalEvent,
  ].each do |type|
    describe type do
      it "should be an event" do
        type.new
          .is_a?(LemonadeStand::Event)
          .must_equal true
      end
    end
  end

end

describe LemonadeStand::NormalEvent do

  describe "modify" do

    let(:choice) { Struct.new(:max_sales).new Object.new }

    it "should return the default max sales" do
      event = LemonadeStand::NormalEvent.new
      result = event.modify choice
      result.must_be_same_as choice.max_sales
    end

  end

end


describe LemonadeStand::HeatWaveEvent do
  [
    [1, 2],
    [2, 4],
    [3, 6],
  ].map { |x| Struct.new(:max_sales, :expected).new *x }.each do |example|
    describe "multiple examples" do
      it "should double the maximum sales" do
        choice = Struct.new(:max_sales).new example.max_sales
        result = LemonadeStand::HeatWaveEvent.new.modify choice
        result.must_equal example.expected
      end
    end
  end
end

describe LemonadeStand::HeatWaveEvent do
  it "should return 0" do
    result = LemonadeStand::StormEvent.new.modify nil
    result.must_equal 0
  end
end

describe LemonadeStand::StreetWorkEvent do

  let(:choice) { Struct.new(:glasses_made).new Object.new }
  let(:event)  { LemonadeStand::StreetWorkEvent.new }

  (0...2).to_a.each do |random_value|
    describe "random 0-4 is #{random_value}" do
      before { event.stubs(:rand).with(4).returns random_value }
      it "should return 0" do
        result = event.modify choice
        result.must_equal 0
      end
    end
  end

  describe "random 0-4 is 3" do
    before { event.stubs(:rand).with(4).returns 3 }
    it "should return the glasses sold" do
      result = event.modify choice
      result.must_be_same_as choice.glasses_made
    end
  end
end

describe LemonadeStand::RainEvent do

  let(:choice) { Struct.new(:glasses_made).new Object.new }
  let(:event)  { LemonadeStand::RainEvent.new }

  [
    [0.0001, 0.30, 10,  7],
    [0.9999, 0.80, 10,  2],
    [0.0329, 0.32, 100, 68],
    [0.5,    0.55, 100, 45],
  ].map { |x| Struct.new(:random, :chance_of_rain, :previous_max_sales, :new_max_sales).new *x }.each do |example|

    describe "chance of rain" do

      before { event.stubs(:rand).returns example.random }

      it "should calculate the chance of rain (#{example.chance_of_rain})" do
        event.chance_of_rain.must_equal example.chance_of_rain
      end

    end

    describe "calculating sales for the day" do

      before do
        event.stubs(:rand).returns example.random
        choice.stubs(:max_sales).returns example.previous_max_sales
      end

      it "should alter the max sales according to the chance of rain" do
        result = event.modify choice
        result.must_equal example.new_max_sales
      end

      it "should return an integer" do
        result = event.modify choice
        result.class.must_equal Fixnum
      end

    end

  end

end
