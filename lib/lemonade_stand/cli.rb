# _dw clean up
require 'yaml'

module LemonadeStand
  class CLI

    attr_reader :gamemaster

    def play
      load_yaml
      puts welcome
      puts " "
      gather_participants
      start_game
      end_game
    end

  private

    def start_game
      gamemaster.start_game
    end

    def welcome
      @text['settings']['game_banner']
    end

    def end_game
      LemonadeStand::Audit.new.squeeze
    end

    def settings
    end

    def gather_participants
      text_formatter_with_prompt_and_sound(@text['setup']['player_count'])
        @player_count = gets.chomp
        @player_count = validate @player_count
      text_formatter_with_prompt_and_sound(@text['setup']['round_count'])
        @round_count = gets.chomp
        @round_count = validate @round_count
      recruit_gamemaster({
        players: @player_count,
        rounds: @round_count
        })
    end

    def recruit_gamemaster config
      @gamemaster ||= LemonadeStand::GameMaster.new(config)
    end

    def text_formatter_with_prompt_and_sound(question)
      puts question
      print " > "
      `say "#{question}"` if @text['settings']['mute']
    end

    def load_yaml
      filepath = File.join(File.dirname(__FILE__),"../yaml/audio_script.yaml")
      @text = YAML.load_file(filepath)

      `say "#{@text['welcome']['one']}"` if @text['settings']['mute']
    end

    def validate entry
      while is_a_letter? entry
        puts "'#{entry}' is not a number."
         `say Error please enter a number` if @text['settings']['mute']

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
