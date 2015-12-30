module LemonadeStand
  class Setting

    attr_reader :player_count, :round_count

    def initialize(config)
      @player_count = config[:players]
      @round_count  = config[:rounds]
      load_yaml
    end

  private

    def load_yaml
      filepath = File.join(File.dirname(__FILE__),"../yaml/audio_script.yaml")
      @text = YAML.load_file(filepath)
    end
  end
end
