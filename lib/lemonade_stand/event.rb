module LemonadeStand

  class Event

    def modify choice
      choice.max_sales
    end

    def self.for day
      type = [:sunny, :hot_and_dry, :cloudy].select { |x| day.weather.send("#{x}?".to_sym) }.first
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

  class RainEvent < Event
    def chance_of_rain
      (rand * 0.5 + 0.3).round(2)
    end

    def modify choice
      ((1 - chance_of_rain) * choice.max_sales).round
    end
  end
  class StormEvent < Event
    def modify _
      0
    end
  end
  class HeatWaveEvent < Event; 
    def modify choice
      choice.max_sales * 2
    end
  end
  class StreetWorkEvent < Event
    def modify choice
      rand(4) == 3 ? choice.glasses_made : 0
    end
  end
  class NormalEvent < Event; end


end
