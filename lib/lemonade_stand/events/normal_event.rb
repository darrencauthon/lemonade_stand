module LemonadeStand

  class NormalEvent < Event

    def modify choice
      choice.max_sales
    end

  end

end
