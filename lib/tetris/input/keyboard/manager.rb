dirname = File.expand_path File.dirname __FILE__
$LOAD_PATH.unshift(dirname) unless $LOAD_PATH.include? dirname

require 'config'
require 'player'

module Tetris
  module Input
    module Keyboard
      class Manager
        include Config


        def initialize(window, game_engine, responsiveness)
          @game_engine = game_engine

          config = { window: window,
                     game_engine: game_engine,
                     responsiveness: responsiveness }

          @players = Array.new(no_of_players) do |index|
            Player.new(prepare_player_config(config, index))
          end
        end

        def listener
          @players.each { |player| player.listener }
        end

        def reset_ticker(key)
          player = player_associated_with key
          player.reset_ticker if player
        end

        private

        def prepare_player_config(config, index)
          config.merge(keys_config: Config::PLAYER_CONFIGS[index],
                       player: @game_engine.players[index])
        end

        def no_of_players
          @game_engine.players.count
        end

        def player_associated_with key
          config = Config::PLAYER_CONFIGS.detect { |cfg| cfg.values.include? key }
          @players.detect { |player| player.keys_config == config }
        end
      end
    end
  end
end
