module LemonadeStand
  class Event
    def self.for day
      return sunny_event if day.weather.sunny?
      day.weather.hot_and_dry? ? hot_and_dry_event : cloudy_event
    end

    def self.sunny_event_for day
      if day.number > 2 && rand(100) < 25
        return build(:street_work)
      end
      return build(:normal)
    end

    def self.cloudy_event_for day
      if rand(100) < 25
        return build(:storm)
      end
      return build(:rain)
    end
  end
end
