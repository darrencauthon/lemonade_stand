module LemonadeStand
  class Audit

    def initialize gamemaster
      load_yaml
      @gamemaster = gamemaster
    end

    def squeeze
      puts "The game is over!"
      `say The game is over!` if @text['settings']['mute']
      # winner = @gamemaster.players.sort_by { |x| x.assets }[-1]
      # puts "The winner is: Player #{winner.index}"
    end
  private

    def load_yaml
      filepath = File.join(File.dirname(__FILE__),"../yaml/audio_script.yaml")
      @text = YAML.load_file(filepath)
    end
  end
end
