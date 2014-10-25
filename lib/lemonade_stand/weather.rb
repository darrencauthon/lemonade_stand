module LemonadeStand

  class Weather

    def initialize type
      @type = type
    end

    def method_missing(meth, *args, &blk)
      meth.to_s == "#{@type}?"
    end

    def self.weather_for day
      if day.number < 3
        new :sunny
      else
        random_value = rand(10)
        if random_value < 6
          new :sunny
        elsif random_value < 8
          new :cloudy
        else
          new :hot_and_dry
        end
      end
    end

  end

end
