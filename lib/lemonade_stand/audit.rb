module LemonadeStand
  class Audit

    def initialize
      load_yaml
    end

    def squeeze
      puts "The game  is over!"
      `say The game is over!` if @text['settings']['mute']
      1
    end

  private

    def load_yaml
      filepath = File.join(File.dirname(__FILE__),"../yaml/audio_script.yaml")
      @text = YAML.load_file(filepath)
    end
  end
end
