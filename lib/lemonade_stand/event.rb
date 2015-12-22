# _dw Journal
# I made it here from day.rb:34
# I think the purpose of this class is to chose which event to use for the user.
# The use of class methods, a build type, and random calculations gives me the impression this class is doing to much.

module LemonadeStand

  class Event

    DAY_TYPES = [:sunny, :hot_and_dry, :cloudy]

    def self.for day
      type = DAY_TYPES.select { |x| day.weather.send("#{x}?".to_sym) }.first
      send("#{type}_event_for".to_sym, day)
    end

    def self.sunny_event_for day
      return build(:street_work) if day.number > 2 && rand(100) < 25
      build(:normal)
    end

    def self.cloudy_event_for _
      return build(:storm) if rand(100) < 25
      build(:rain)
    end

    def self.hot_and_dry_event_for _
      build(:heat_wave)
    end

    def self.build type
      the_class = "LemonadeStand::#{type.to_s.split('_').map { |x| x.capitalize }.join('')}Event"
      eval(the_class).new
    end

  end

end
