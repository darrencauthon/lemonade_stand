module LemonadeStand

  class Day
    
    attr_accessor :number

    def projected_weather_report
      @projected_weather_report ||= LemonadeStand::Weather.projected_weather_for self
    end

    def weather
      @weather ||= LemonadeStand::Weather.weather_for self
    end

    def sales_for choice
      LemonadeStand::Result.new( { glasses_sold: calculate_glasses_sold(choice) } )
    end

    def cost_per_glass
      case number
      when (1..2) then 2
      when (3..4) then 4
      else 5
      end
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
