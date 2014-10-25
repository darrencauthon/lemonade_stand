module LemonadeStand
  class Event
    def self.for day
      return sunny_event if day.weather.sunny?
      day.weather.hot_and_dry? ? hot_and_dry_event : cloudy_event
    end
  end
end
