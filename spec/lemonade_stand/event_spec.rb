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

end
