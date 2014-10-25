module LemonadeStand

  class Day

    def projected_weather_report
      @projected_weather_report ||= LemonadeStand::Weather.projected_weather_for self
    end

    def weather
      @weather ||= LemonadeStand::Weather.weather_for self
    end

    def sales_for choice
      Struct.new(:glasses_sold).new calculate_glasses_sold(choice)
    end

    def calculate_glasses_sold choice
      [choice.max_sales, event.modify(choice)]
        .sort_by { |x| x }.first
    end

    def event
      @event ||= Event.for(self)
    end

  end

end
