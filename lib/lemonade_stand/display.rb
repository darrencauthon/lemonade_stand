require 'money'

module LemonadeStand

  module Display

    def self.money input
      Money.use_i18n = false
      "$#{Money.new(input)}"
    end

  end

end
