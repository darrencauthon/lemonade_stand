require "lemonade_stand/version"
Dir[File.dirname(__FILE__) + '/lemonade_stand/*.rb'].each { |f| require f }
Dir[File.dirname(__FILE__) + '/lemonade_stand/events/*.rb'].each {|f| require f }

module LemonadeStand
  # Your code goes here...
end
