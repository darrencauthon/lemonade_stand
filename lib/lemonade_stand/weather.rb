module LemonadeStand

  class Weather

    def initialize type
      @type = type
    end

    def method_missing(meth, *args, &blk)
      meth.to_s == "#{@type}?"
    end

    def to_s
      @type.to_s.split('_').map { |x| x == 'and' ? x : x.capitalize! }.join(' ')
    end

    def self.weather_for day
      type = if day.number < 3
               :sunny
             else
               case rand(10)
               when 0..5 then :sunny
               when 6..7 then :cloudy
               else :hot_and_dry
               end
             end
      new type
    end

  end

end
