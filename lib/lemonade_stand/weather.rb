module LemonadeStand
  module Weather

    def self.weather_for day
      sunny = day.number < 3
      random_value = rand(10)
      cloudy = !sunny && (random_value == 6 || random_value == 7)
      hot_and_dry = !sunny && !cloudy && (random_value == 8 || random_value == 9)
      sunny = !cloudy & !hot_and_dry
      Struct.new(:sunny?, :cloudy?, :hot_and_dry?).new sunny, cloudy, hot_and_dry
    end

  end
end
