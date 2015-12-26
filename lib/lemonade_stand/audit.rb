module LemonadeStand
  class Audit

    attr_reader :gamemaster

    def initialize gamemaster
      load_yaml
      @gamemaster = gamemaster
      # _dw how can @gamemaster be inherited from < Base something?
    end

    def squeeze
      puts "The game is over!"
      `say The game is over!` if @text['settings']['mute']

      gamemaster.reconcile
    end

  private

    def review_the_books
      gamemaster.reconcile
    end


    def load_yaml
      filepath = File.join(File.dirname(__FILE__),"../yaml/audio_script.yaml")
      @text = YAML.load_file(filepath)
    end
  end
end
