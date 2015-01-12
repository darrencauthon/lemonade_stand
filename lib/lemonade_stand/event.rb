module LemonadeStand

  class Event

    DAY_TYPES = [:sunny, :hot_and_dry, :cloudy]

    def self.for day
      type = DAY_TYPES.select { |x| day.weather.send("#{x}?".to_sym) }.first
      send("#{type}_event_for".to_sym, day)
    end

    def self.sunny_event_for day
      if day.number > 2 && rand(100) < 25
        return build(:street_work)
      end
      return build(:normal)
    end

    def self.cloudy_event_for _
      if rand(100) < 25
        return build(:storm)
      end
      return build(:rain)
    end

    def self.hot_and_dry_event_for _
      build(:heat_wave)
    end
    
    def self.build type
      eval("LemonadeStand::#{type.to_s.split('_').map { |x| x.capitalize }.join('')}Event").new
    end

  end

end
