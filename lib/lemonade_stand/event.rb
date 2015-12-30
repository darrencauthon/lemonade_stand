module LemonadeStand
  class Event
    def initialize
      @chaos = Chaos.new(self)
    end

    def status
      @chaos.effect
    end
  end
end
