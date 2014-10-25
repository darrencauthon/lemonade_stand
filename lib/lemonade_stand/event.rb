module LemonadeStand
  class Event
    def self.for day
      return sunny_event_for(day) if day.weather.sunny?
      day.weather.hot_and_dry? ? hot_and_dry_event_for(day) : cloudy_event_for(day)
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
  end
end
