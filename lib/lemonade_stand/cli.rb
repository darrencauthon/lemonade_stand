require 'yaml'

module LemonadeStand

  class CLI

    def play
      load_yaml
      set_players_and_days
      @gamemaster.start_game
      end_game
    end

  private

    def end_game
      LemonadeStand::Audit.new(@gamemaster).squeeze
    end

    def set_players_and_days
      `say "#{@text['welcome']['one']}"`
      text_formatter_with_prompt_and_sound(@text['setup']['player_setup'])
      @number_of_players = gets.chomp
      @number_of_players = validate @number_of_players
      recruit_gamemaster(@number_of_players)

      text_formatter_with_prompt_and_sound(@text['setup']['length_of_game'])
      @number_of_days = gets.chomp
      @number_of_days = validate @number_of_days
      @gamemaster.total_days @number_of_days
    end

    def recruit_gamemaster players
      @gamemaster ||= LemonadeStand::GameMaster.new(players)
    end
    def text_formatter_with_prompt_and_sound(question)
      puts question
      print " > "
      `say "#{question}"`
    end

    def load_yaml
      filepath = File.join(File.dirname(__FILE__),"../yaml/audio_script.yaml")
      @text = YAML.load_file(filepath)
    end

    def validate entry
      while is_a_letter? entry
        puts "#{entry} is not a number."
         `say Error please enter a number`

        print " > "
        entry = gets.chomp
        @foo = entry.to_i
      end
      entry.to_i || @foo
    end

    def is_a_letter? entry
      !(entry.to_i.to_s == entry)
    end
  end
end


