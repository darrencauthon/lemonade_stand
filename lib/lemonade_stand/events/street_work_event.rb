module LemonadeStand

  class StreetWorkEvent < Event

    def modify choice
      rand(4) == 3 ? choice.glasses_made : 0
    end

  end

end
